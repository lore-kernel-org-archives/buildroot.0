From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:15:05 +0200
Subject: [Buildroot] [PATCH 1/1] pinentry: link with libatomic when
 needed
In-Reply-To: <20180614180204.17438-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 14 Jun 2018 20:02:04 +0200")
References: <20180614180204.17438-1-fontaine.fabrice@gmail.com>
Message-ID: <87fu0gi6ue.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Following errors might occur on architectures required to use gcc
 > libatomics:
 > sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding
 > symbols: DSO missing from command line

 > This is often the case for sparcv8 32 bit toolchains.

 > See d28591a2ee39704f6795c8aa1d0a3db7e909facc,
 > 55a9d6d55888b04ec6c476399e5b98a2412995f5 and
 > 03f6e005e6a9617767b24a9026da9477848020cc.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/fd6bee70ff20bee9607a9f6f557a3a793d00cd9f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
