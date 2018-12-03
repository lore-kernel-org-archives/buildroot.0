From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 22:48:35 +0100
Subject: [Buildroot] [PATCH] package/dante: needs autoreconf
In-Reply-To: <20181125112612.8170-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 25 Nov 2018 12:26:12 +0100")
References: <20181125112612.8170-1-yann.morin.1998@free.fr>
Message-ID: <87r2ey46z0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > We have a patch that touches a .m4 file, so we need to regenerate the
 > configure script. Otherwise, this is done during the build step, and
 > some environment variables are thus missing and the build may fail when
 > the host machine does not have the expected autostuff tools.

 > Fixes:
 >     http://autobuild.buildroot.org/results/e37/e37e61bae1d81a7956e2843be70fea84b0bbb64b/
 >     http://autobuild.buildroot.org/results/f96/f969718402cae71446d6280ec1f66d357a155293/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
