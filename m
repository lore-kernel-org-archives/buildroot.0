From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Mar 2019 16:22:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/botan: link with libatomic when
 needed
In-Reply-To: <20190215220110.13519-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 15 Feb 2019 23:01:10 +0100")
References: <20190215220110.13519-1-fontaine.fabrice@gmail.com>
Message-ID: <87a7hwb1ru.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > On some architectures, atomic binutils are provided by the libatomic
 > library from gcc. Linking with libatomic is therefore necessary,
 > otherwise the build fails with:

 > sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

 > This is often for example the case on sparcv8 32 bit.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a442734c570e4a02854014d831ba3aab9f592430

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
