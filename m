From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 17:54:54 +0200
Subject: [Buildroot] [PATCH 1/1] libseccomp: bump to version 2.3.3
In-Reply-To: <20180606203355.17461-1-fontaine.fabrice@gmail.com>
References: <20180606203355.17461-1-fontaine.fabrice@gmail.com>
Message-ID: <20180607175454.7d849238@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Jun 2018 22:33:55 +0200, Fabrice Fontaine wrote:
> - Update patch and sent it upstream
> - Remove LIBSECCOMP_FIXUP_M4_DIR (not needed anymore)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libseccomp/0001-remove-static.patch | 41 +++++++++++++++++------------
>  package/libseccomp/libseccomp.hash          |  3 ++-
>  package/libseccomp/libseccomp.mk            |  8 +-----
>  3 files changed, 27 insertions(+), 25 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
