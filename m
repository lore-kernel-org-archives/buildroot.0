From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 18:07:15 +0100
Subject: [Buildroot] [PATCH 1/2] libvncserver: bump version to 0.9.10
In-Reply-To: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
References: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20141226180715.22bbd2a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Fri, 26 Dec 2014 01:46:14 +0100, Floris Bos wrote:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  .../libvncserver-0001-CVE-2014-6051-6052.patch     |  85 ------------
>  .../libvncserver-0002-CVE-2014-6053.patch          |  21 ---
>  .../libvncserver-0003-CVE-2014-6054.patch          |  87 ------------
>  .../libvncserver-0004-CVE-2014-6055.patch          | 150 ---------------------
>  package/libvncserver/libvncserver.mk               |   5 +-
>  5 files changed, 3 insertions(+), 345 deletions(-)
>  delete mode 100644 package/libvncserver/libvncserver-0001-CVE-2014-6051-6052.patch
>  delete mode 100644 package/libvncserver/libvncserver-0002-CVE-2014-6053.patch
>  delete mode 100644 package/libvncserver/libvncserver-0003-CVE-2014-6054.patch
>  delete mode 100644 package/libvncserver/libvncserver-0004-CVE-2014-6055.patch

Applied, after adding a comment about AUTORECONF = YES, and adding
host-pkgconf to the dependencies, since configure.ac uses
PKG_CHECK_MODULES
.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
