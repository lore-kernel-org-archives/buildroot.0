From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:47:57 +0100
Subject: [Buildroot] [PATCH 1/1] qt5charts: new package
In-Reply-To: <1509640022-16933-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1509640022-16933-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20171203234757.68a42e86@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Nov 2017 17:27:02 +0100, S?bastien Szymanski wrote:
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  package/qt5/Config.in                |  1 +
>  package/qt5/qt5charts/Config.in      | 15 +++++++++
>  package/qt5/qt5charts/qt5charts.hash |  5 +++
>  package/qt5/qt5charts/qt5charts.mk   | 59 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 80 insertions(+)
>  create mode 100644 package/qt5/qt5charts/Config.in
>  create mode 100644 package/qt5/qt5charts/qt5charts.hash
>  create mode 100644 package/qt5/qt5charts/qt5charts.mk

Applied to master, after updating to Qt 5.9.3 (all other Qt packages
were bumped) and adding an entry to the DEVELOPERS file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
