From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 21:31:29 +0200
Subject: [Buildroot] [PATCH 1/1] libarchive: add selection of bsdcat
In-Reply-To: <1469537933-14566-1-git-send-email-fhunleth@troodon-software.com>
References: <1469537933-14566-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160727213129.6738e853@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 08:58:53 -0400, Frank Hunleth wrote:
> libarchive builds three commandline utilities: bsdtar, bsdcpio, and
> bsdcat. This change adds control over the third utility to the list of
> configuration options.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/libarchive/Config.in     |  6 ++++++
>  package/libarchive/libarchive.mk | 11 +++++++++++
>  2 files changed, 17 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
