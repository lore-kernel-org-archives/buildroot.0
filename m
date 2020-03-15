From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 22:51:52 +0100
Subject: [Buildroot] [PATCH v3] package/qt5xmlpatterns: enable qml module
In-Reply-To: <20200314175608.18557-1-ps.report@gmx.net>
References: <20200314175608.18557-1-ps.report@gmx.net>
Message-ID: <20200315225152.2e37462d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Mar 2020 18:56:08 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> qt5declarative:
>  - remove unneded dependency on qt5mlpatterns
> 
> qt5xmlpatterns:
>  - add optional dependency on qt5declarative
> 
> Reported-by: Nimai Mahajan <nimaim@gmail.com>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - add Reported-by
>   - - s/=/+=/ for qt5declarative dependency
> Changes v2 -> v3:
>   - rebase on master, adjusted to qmake-package, adjusted commit message
> ---
>  package/qt5/qt5declarative/Config.in         | 1 -
>  package/qt5/qt5declarative/qt5declarative.mk | 1 -
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 4 ++++
>  3 files changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
