From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:47:08 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/qt5: simplify and cleanup
 _SITE variables
In-Reply-To: <20171128115930.10887-1-gael.portay@savoirfairelinux.com>
References: <20171128115930.10887-1-gael.portay@savoirfairelinux.com>
Message-ID: <20171129214708.27741f53@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Nov 2017 06:59:30 -0500, Ga?l PORTAY wrote:
> The variable QT5_SNAPSHOTS_SITE was introduced in commit 9d5ac9698 to
> fetch sources of obsolete modules. It was used to download qt5webkit
> tarballs.
> 
> The variable is not referenced anymore since the qt5webkit tarballs are
> downloaded from the Qt community release site.
> 
> Since the introduction of qt-5.9 in aa1c40ba3, the QT5_SITE variable
> was duplicates for no good reason.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/qt5/qt5.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
