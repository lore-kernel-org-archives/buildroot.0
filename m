From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Mar 2009 21:16:47 +0100
Subject: [Buildroot] svn commit: [25555]
	trunk/buildroot/package/logrotate
In-Reply-To: <d6a0e5a20903071134r76b57442j84dd87b627a3b4f7@mail.gmail.com>
	(Hiroshi Shinji's message of "Sun\, 8 Mar 2009 04\:34\:54 +0900")
References: <20090305190018.85BAD76465@busybox.osuosl.org>
	<d6a0e5a20903071134r76b57442j84dd87b627a3b4f7@mail.gmail.com>
Message-ID: <87zlfxccls.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hiroshi" == Hiroshi Shinji <hiroshi.shinji@gmail.com> writes:

 Hiroshi> Hi,
 >> +       if [ ! -f $(TARGET_DIR)/etc/logrotate.conf ]; then
 >> +               $(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf;

 Hiroshi> You need to append backslashes to the end of these lines.

But ofcourse - Thanks.

That's what I get from trying to do too many things at once.

-- 
Bye, Peter Korsgaard
