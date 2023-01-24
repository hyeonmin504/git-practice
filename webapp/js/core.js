var AJAX = {
	call: function(url, params, func, isfd) {
		var callobj = {
			url: url,
			type: "post",
			data: params,
			dataType: "text",
			contentType: "application/x-www-form-urlencoded; charset=euc-kr",
			success: func,
			
			error: function(xhr, status, error) {
				if (xhr.status == 0) {
					alert("network problems");
				}
				else {
					console.log(xhr.responseText);
					alert("error");
				}
			},
		};
		if (isfd) {
			callobj.processData = false;
			callobj.contentType = false;
		}
		jQuery.ajax(callobj);
	}
};

var Page = {
	init: function(cbfunc, url) {
		AJAX.call("jsp/session.jsp", null, function(data) {
			var uid = data.trim();
			if (uid == "null") {
				alert("need login.");
				window.location.href = "login.html";
			}
			else {
				var param = (url == null) ? null : SessionStore.get(url);
				if (cbfunc != null) cbfunc(uid, param);
			}
		});
	},
	go: function(url, param) {
		SessionStore.set(url, param);
		window.location.href = url;
	},
};

var SessionStore = {
	set: function(name, val) {
		sessionStorage.setItem(name, JSON.stringify(val));
	},
	get: function(name) {
		var str = sessionStorage.getItem(name);
		return (str == null || str == "null") ? null : JSON.parse(str);
	},
	remove: function(name) {
		sessionStorage.removeItem(name);
	},
};

var DataCache = {
	set: function(name, data) {
		var obj = { ts: Date.now(), data: data };
		SessionStore.set(name, obj);
	},
	get: function(name) {
		var obj = SessionStore.get(name);
		if (obj == null) {
			return null;
		}
		var diff = (Date.now() - obj.ts) / 60000;
		if (diff > 10) { // if 10 minutes expired
			SessionStore.remove(name);
			return null;
		}
		return obj.data;
	},

	remove: function(name) {
		SessionStore.remove(name);
	}
};