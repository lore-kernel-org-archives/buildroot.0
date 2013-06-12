From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Jun 2013 22:50:13 +0200
Subject: [Buildroot] [PATCH v2] usb_modeswitch: bump to version 1.2.6
In-Reply-To: <51B740AC.5010406@fh-kl.de> (Patrick Ziegler's message of "Tue,
 11 Jun 2013 17:22:20 +0200")
References: <51B740AC.5010406@fh-kl.de>
Message-ID: <87bo7b2gvu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Ziegler <patrick.ziegler@fh-kl.de> writes:

 Patrick> Remove 'usb_modeswitch-makefile.patch' because it was merged
 Patrick> upstream.  This package contains a dispatcher (wrapper) that
 Patrick> can be installed as Tcl script or as binary without further
 Patrick> dependency. If Tcl is selected and the binary interpreter is
 Patrick> installed (BR2_PACKAGE_TCL && !BR2_PACKAGE_TCL_SHLIB_ONLY) the
 Patrick> dispatcher will be installed as Tcl script otherwise as
 Patrick> binary.

Committed, thanks.

-- 
Bye, Peter Korsgaard
