From: John Voltz <john.voltz@gmail.com>
Date: Tue, 8 Jul 2008 11:42:37 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <46a136670807080834i61e09b53t93d7e8284e95759d@mail.gmail.com>
References: <20080708101305.8702C3C697@busybox.net>
	<d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>
	<87bq18mtwg.fsf@macbook.be.48ers.dk>
	<d6cda7730807080616s2f16871fo498ad1ea9095ef75@mail.gmail.com>
	<87lk0cjyh3.fsf@macbook.be.48ers.dk>
	<d6cda7730807080635m5c2949e2me4b4cca844e82e07@mail.gmail.com>
	<87vdzgh4ko.fsf@macbook.be.48ers.dk>
	<d6cda7730807080756qb660dd7k19a618ce9d90ad7b@mail.gmail.com>
	<87prpobeqx.fsf@macbook.be.48ers.dk>
	<46a136670807080834i61e09b53t93d7e8284e95759d@mail.gmail.com>
Message-ID: <46a136670807080842h36f9ef6dnb4e514d631e9a15b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been able to verify that the openssl/libcurl subsystem works with lynx.
I haven't been able to get it to work with Midori/WebKit. I'm not even sure
that WebKit fully supports SSL through libcurl yet. If you export
WEBKIT_IGNORE_SSL_ERRORS=true before you start Midori, secure sites will
load, but it is obviously not necessarily truly a secure connection.

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080708/e71d8178/attachment.htm 
