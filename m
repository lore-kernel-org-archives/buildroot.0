From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 15:56:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/kf5-modemmanager-qt: link with
 libatomic when needed
In-Reply-To: <20190317211016.2052-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Mar 2019 22:10:16 +0100")
References: <20190317211016.2052-1-fontaine.fabrice@gmail.com>
Message-ID: <875zs4s6vd.fsf@dell.be.48ers.dk>
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
 >  - http://autobuild.buildroot.org/results/b941a3deaa57cac79f1686d47ca6ababf2f0d5e4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
