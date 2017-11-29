From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 22:23:20 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "package/qt5webkit-examples:
 remove obsolete package"
In-Reply-To: <20171129045038.26578-1-gael.portay@savoirfairelinux.com>
References: <20171129045038.26578-1-gael.portay@savoirfairelinux.com>
Message-ID: <20171129222320.586bf581@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Nov 2017 23:50:38 -0500, Ga?l PORTAY wrote:
> This reverts commit 940bfe2f4336a3fea1ec6805db1f90ce83bd4a78 with the
> following changes:
> 
> 	- new hashes for 5.6.3 and 5.9.1 (there is no 5.9.2).
> 	- BR2_PACKAGE_QT5BASE_LICENSE_APPROVED has been removed
> 	- add GPL-3 to licences
> 	- uses SPDX identifier for licences
> 	- add missing dependencies (qt5base, qt5webkit, qt5declarative)
> 	- removes /usr when qmake host-tools is invoked at configure
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  Config.in.legacy                                   |  7 ---
>  package/qt5/Config.in                              |  1 +
>  .../qt5webkit-examples/0001-Build-examples.patch   | 52 +++++++++++++++++++++
>  package/qt5/qt5webkit-examples/Config.in           | 10 ++++
>  .../qt5/qt5webkit-examples/qt5webkit-examples.hash |  5 ++
>  .../qt5/qt5webkit-examples/qt5webkit-examples.mk   | 54 ++++++++++++++++++++++
>  6 files changed, 122 insertions(+), 7 deletions(-)
>  create mode 100644 package/qt5/qt5webkit-examples/0001-Build-examples.patch
>  create mode 100644 package/qt5/qt5webkit-examples/Config.in
>  create mode 100644 package/qt5/qt5webkit-examples/qt5webkit-examples.hash
>  create mode 100644 package/qt5/qt5webkit-examples/qt5webkit-examples.mk

Applied to next, after adding an entry in the DEVELOPERS file to
reference you as a developer for qt5webkit-examples.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
