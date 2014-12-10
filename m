From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 00:18:20 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/openpowerlink: bump to
 version 1.8.5
In-Reply-To: <1418246696-27658-1-git-send-email-romain.naour@openwide.fr>
References: <1418246696-27658-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141211001820.613b289b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 10 Dec 2014 22:24:54 +0100, Romain Naour wrote:
> Remove upstream commit
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: First bump the vertion to avoid to rename the existing patch.
> ---
>  ...-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch | 28 ----------------------
>  package/openpowerlink/openpowerlink.mk             |  2 +-
>  2 files changed, 1 insertion(+), 29 deletions(-)
>  delete mode 100644 package/openpowerlink/openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch

Applied, thanks. I don't know if it's related to the bump, but it's
showing here a message that might be worth investigating:

CMake Warning at /home/thomas/projets/buildroot/output/host/usr/share/cmake-3.0/Modules/FindQt4.cmake:616 (message):
  /usr/bin/qmake reported QT_INSTALL_LIBS as "/usr/lib/x86_64-linux-gnu" but
  QtCore could not be found there.  Qt is NOT installed correctly for the
  target build environment.
Call Stack (most recent call first):
  CMakeLists.txt:72 (FIND_PACKAGE)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
