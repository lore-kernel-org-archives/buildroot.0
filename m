From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 23:40:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/qlibc: bump version to 2.4.1
In-Reply-To: <1463818975-16680-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463818975-16680-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160601234021.10b0ee5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 May 2016 10:22:55 +0200, Bernd Kuhls wrote:
> This patch depends on http://patchwork.ozlabs.org/patch/624729/
> 
> Rebased 0002-obey-destdir.patch using upstream commit.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/qlibc/0002-obey-destdir.patch              | 154 ++++++++++++++-------
>  ...l-build-by-removing-usage-of-internal-gli.patch |  11 +-
>  package/qlibc/qlibc.mk                             |   2 +-
>  3 files changed, 110 insertions(+), 57 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
