From: ilranzani <marco_cantu_ranzani@libero.it>
Date: Mon, 24 Oct 2011 08:53:20 -0700 (PDT)
Subject: [Buildroot] libtool: Version mismatch error
In-Reply-To: <113697.63851.qm@web120515.mail.ne1.yahoo.com>
References: <113697.63851.qm@web120515.mail.ne1.yahoo.com>
Message-ID: <32711319.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


same problem HERE:

http://old.nabble.com/GnuPG-td29967586.html#a32711202


Solutions?

Thanks!:handshake:


rpbainjr wrote:
> 
> 
> Any,
> 
> I am trying to migrate from buildroot-2009.08 to buildroot-2011.02 for
> arm.
> 
> In a few packages such as tslib and pkg-config (glib) I am getting build
> errors with message 
> 
> ../libtool: line 476: CDPATH: command not found
> ../libtool: line 476: CDPATH: command not found
> ../libtool: line 1300: func_opt_split: command not found
> libtool: Version mismatch error.  This is libtool 2.2.10, but the
> libtool: definition of this LT_INIT comes from an older release.
> libtool: You should recreate aclocal.m4 with macros from libtool 2.2.10
> libtool: and run autoconf again.
> 
> I am running Ubuntu 10.10 and tried 11.04 also.
> 
> Any suggestions?
> 
> Thanks
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
View this message in context: http://old.nabble.com/libtool%3A-Version-mismatch-error-tp31533044p32711319.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
