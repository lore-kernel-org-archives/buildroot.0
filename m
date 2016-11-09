From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:37:38 +0100
Subject: [Buildroot] [PATCH] swupdate: bump to version 2016.10
In-Reply-To: <20161108143446.9525-1-gary.bisson@boundarydevices.com>
References: <20161108143446.9525-1-gary.bisson@boundarydevices.com>
Message-ID: <20161109223738.798b3401@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Nov 2016 15:34:46 +0100, Gary Bisson wrote:
> A short list of new features:
> 
> - progress interface as general way to signalize the update
>   status outside of the process.
> 
> - support encrypted artifacts (encryption via simmetric keys)
> 
> - host verification for swu images (-c option)
> 
> - configuration file to configure the update process
> 
> - HAwkbit backend: API extended, support for configData messages
> 
> - Hawkbit backend: supports SSL certificates
> 
> - remote handler : general interface to connect external
>   installers.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/swupdate/swupdate.hash | 2 +-
>  package/swupdate/swupdate.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
