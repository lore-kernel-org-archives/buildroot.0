From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 12:02:34 +0200
Subject: [Buildroot] [PATCH 1/6] qt5multimedia: make qt5declarative
 dependency optional
In-Reply-To: <1405791208-30356-2-git-send-email-fatih.asici@gmail.com>
References: <1405791208-30356-1-git-send-email-fatih.asici@gmail.com>
 <1405791208-30356-2-git-send-email-fatih.asici@gmail.com>
Message-ID: <20140720120234.14bfc9fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Sat, 19 Jul 2014 20:33:23 +0300, Fatih A??c? wrote:
> Also add missing dependencies on gui and network modules.
> 
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  package/qt5/qt5multimedia/Config.in        | 10 ++--------
>  package/qt5/qt5multimedia/qt5multimedia.mk |  6 +++++-
>  2 files changed, 7 insertions(+), 9 deletions(-)

Applied, thanks. However, please do not send your patches to both
buildroot at uclibc.org and buildroot at buildroot.org: they are the same
mailing list, so your patches appear twice on the list.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
