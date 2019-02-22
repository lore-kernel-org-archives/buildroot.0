From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 13:03:21 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/log4cplus: link with libatomic when needed
In-Reply-To: <20190217093326.5528-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Feb 2019 10:33:26 +0100")
References: <20190217093326.5528-1-fontaine.fabrice@gmail.com>
Message-ID: <87mumokp2u.fsf@dell.be.48ers.dk>
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
 >  - http://autobuild.buildroot.org/results/16e360cb91afff7655f459a3d1fb906ca48f8464

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Fix patch so that it applies on current master

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
