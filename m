From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 28 Nov 2017 07:06:38 -0500
Subject: [Buildroot] [PATCH v2 1/1] package/qt5: simplify and cleanup
 _SITE variables
In-Reply-To: <20171128115930.10887-1-gael.portay@savoirfairelinux.com>
References: <20171128115930.10887-1-gael.portay@savoirfairelinux.com>
Message-ID: <20171128120638.kihab5miok4mhnzl@archlinux.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the missing changelog.

On Tue, Nov 28, 2017 at 06:59:30AM -0500, Ga?l PORTAY wrote:
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

Changes since v1:
 * reword asked by Yann to complete the commit message.
 * add the acked-by of Yann.
