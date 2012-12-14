From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Dec 2012 22:24:57 +0100
Subject: [Buildroot] [PATCH] gettext: fix build failure with locale and
	uclibc
In-Reply-To: <1355512517-24342-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 14 Dec 2012 16:15:17 -0300")
References: <1355512517-24342-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2yciaxi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> As reported by Johan Sagaert in the mailing list, if it's
 Gustavo> building with a uClibc toolchain with locale enabled the build
 Gustavo> fails since the new gettext does a locale hack for glibc which
 Gustavo> isn't needed nor supported.

Committed, thanks.

-- 
Bye, Peter Korsgaard
