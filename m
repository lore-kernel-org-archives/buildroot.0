From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:34:45 +0100
Subject: [Buildroot] [PATCH 6/6] package/mpd: add choice between version
 0.19 and 0.20
In-Reply-To: <20170209174759.15819-7-joerg.krause@embedded.rocks>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
 <20170209174759.15819-7-joerg.krause@embedded.rocks>
Message-ID: <20170209213445.4b012033@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Feb 2017 18:47:59 +0100, J?rg Krause wrote:
> MPD version 0.20 being affected by GCC PR libstdc++/64735 means no mpd
> package available in Buildroot for the architectures NIOSII, ARMv4,
> ARMv5 and SPARCv8 until GCC 7 is released.
> 
> As the next Buildroot release is in 2017.02 which is before GCC 7 is
> expected to be released add a choise between version 0.19 and 0.20, so
> that there is still an mpd package available for the affected
> architectures.
> 
> Note, that we bumped the version from 0.19 to 0.20 within the current Buildroot
> release cycle.
> 
> Note, that for the version 0.19 MPD requires libglib2.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

I am not sure we want to support a version choice for mpd just for the
sake of NIOSII, ARMv4, ARMv5 and SPARCv8.

I'll let Peter Korsgaard decide if he believes this is worth the
additional complexity.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
