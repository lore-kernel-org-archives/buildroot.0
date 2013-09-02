From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Sep 2013 22:49:58 +0200
Subject: [Buildroot] [PATCH v2 1/1] libffi: minor corrections in post
	install hooks
In-Reply-To: <1493594999.5624151.1377683339178.JavaMail.root@openwide.fr>
 ("Nicolas =?utf-8?B?TcOpbsOpZ2FsZSIncw==?= message of "Wed, 28 Aug 2013
 11:48:59 +0200 (CEST)")
References: <1493594999.5624151.1377683339178.JavaMail.root@openwide.fr>
Message-ID: <871u579ceh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas M?n?gale <nicolas.menegale@openwide.fr> writes:

 Nicolas> In order to be sure that we just deal with the includes related with
 Nicolas> the actual package described into libffi.mk it is better to explicitly
 Nicolas> specify the version of the libffi we deal with into the post install
 Nicolas> hook.
 Nicolas> As dev files are deprecated in target rootfs target post install
 Nicolas> hook was also deleted.

Committed, thanks.

-- 
Bye, Peter Korsgaard
