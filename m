From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 18:16:02 +0100
Subject: [Buildroot] [PATCH] qt5: remove qt5jsbackend package
In-Reply-To: <1387866891-31546-1-git-send-email-fatih.asici@gmail.com>
References: <1387866891-31546-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <20131225181602.601bb030@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Tue, 24 Dec 2013 08:34:51 +0200, Fatih A??c? wrote:
> Upstream did not release a new version of this package since it is
> superseded by the builtin qml engine found in new qt5declarative.
> 
> Fixes: http://autobuild.buildroot.net/results/3861aa91e03154c7d20f4157f0c3a1fa14838af1/
> 
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  package/qt5/Config.in                              |  1 -
>  package/qt5/qt5declarative/Config.in               | 13 +++++--
>  package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
>  package/qt5/qt5graphicaleffects/Config.in          |  5 ++-
>  package/qt5/qt5jsbackend/Config.in                 | 19 ----------
>  ...ackend-0001-dont-import-bz2-python-module.patch | 29 ----------------
>  package/qt5/qt5jsbackend/qt5jsbackend.mk           | 40 ----------------------
>  package/qt5/qt5multimedia/Config.in                |  5 ++-
>  package/qt5/qt5quick1/Config.in                    |  5 ++-
>  package/qt5/qt5quick1/qt5quick1.mk                 |  2 +-
>  package/qt5/qt5quickcontrols/Config.in             |  5 ++-
>  11 files changed, 20 insertions(+), 106 deletions(-)
>  delete mode 100644 package/qt5/qt5jsbackend/Config.in
>  delete mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-0001-dont-import-bz2-python-module.patch
>  delete mode 100644 package/qt5/qt5jsbackend/qt5jsbackend.mk

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
