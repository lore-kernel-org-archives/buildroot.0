From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 Jan 2014 23:40:48 +0100
Subject: [Buildroot] [PATCH v2] valgrind: bump to version 3.9.0
In-Reply-To: <1388680480-58533-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Thu, 2 Jan 2014 17:34:40 +0100")
References: <1388680480-58533-1-git-send-email-jezz@sysmic.org>
Message-ID: <87fvp374lr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > Drop some patches:
 >  - glibc 2.17 and 2.18 are now supported by upstream
 >  - coregrind/link_tool_exe_linux.in has been reworked and should now
 >    support ccache

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 > ---
 > v2: 
 >    Fix subject of patch
 >    Use -M option of git-send-email for better reviewing.

 > +++ b/package/valgrind/valgrind.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -VALGRIND_VERSION = 3.8.1
 > +VALGRIND_VERSION = 3.9.0
 >  VALGRIND_SITE    = http://valgrind.org/downloads/
 >  VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
 >  VALGRIND_LICENSE = GPLv2 GFDLv1.2

We can also drop AUTORECONF as we're no longer patching configure.in.

Committed with that fixed, thanks.

 > -- 
 > 1.8.3.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
