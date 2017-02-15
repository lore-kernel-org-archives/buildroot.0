From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:55:33 +0100
Subject: [Buildroot] [PATCH v3] package/mpd: add choice between version
 0.19 and 0.20
In-Reply-To: <20170215145102.14664-1-joerg.krause@embedded.rocks>
References: <20170215145102.14664-1-joerg.krause@embedded.rocks>
Message-ID: <20170215215533.72835dbf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 15:51:02 +0100, J?rg Krause wrote:
> MPD version 0.20 being affected by GCC PR libstdc++/64735 means no mpd package
> available in Buildroot for the architectures NIOSII, ARMv4, ARMv5 and SPARCv8
> until GCC 7 is released.
> 
> As the next Buildroot release is in 2017.02, which is before GCC 7 is expected
> to be finished we add hidden config symbols to select the version branch to use.
> 
> Note, that we bumped the version from 0.19 to 0.20 quite recently within the
> current Buildroot release cycle. This way we can keep the support for mpd on
> the affected architectures, like ARMv5, until GCC 7 is out.
> 
> Note, that for the version 0.19 MPD requires libglib2.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Note that this patch is targeted for the master branch.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
