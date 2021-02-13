From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Feb 2021 11:14:38 +0100
Subject: [Buildroot] [PATCH-NEXT 2/4] package/linux-firmware.mk: get rid
 of temporary tarball for file installation
In-Reply-To: <20210213095154.GP1679218@scaer> (Yann E. MORIN's message of
 "Sat, 13 Feb 2021 10:51:54 +0100")
References: <20210212184049.13202-1-peter@korsgaard.com>
 <20210212184049.13202-3-peter@korsgaard.com>
 <20210212203939.GK1679218@scaer> <87blcpezmw.fsf@dell.be.48ers.dk>
 <20210213083705.GO1679218@scaer> <875z2we1uy.fsf@dell.be.48ers.dk>
 <20210213095154.GP1679218@scaer>
Message-ID: <871rdke0kx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> >> Ok, so we need to stick a set -o pipefail before?
 >> > I prefer if we could cleanup the install sequence, as I suggested and
 >> > proposed in another reply.
 >> Well, having our temporary tarball in the build directory is also kind
 >> of ugly, but ok - Fine by me.

 > That will not be worse than now: we already leave the temporary tarball
 > in the build directory...

Yes, I know - Which was part of the reason for me wanting to change
it. But oh well, it is not a big deal.

-- 
Bye, Peter Korsgaard
