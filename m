From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:35:21 +0200
Subject: [Buildroot] [PATCH] luajit: bump to version 2.0.5
In-Reply-To: <20170502075622.22153-1-francois.perrad@gadz.org>
References: <20170502075622.22153-1-francois.perrad@gadz.org>
Message-ID: <20170502223521.3e08b50b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 May 2017 09:56:22 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/0001-no-bin-symlink.patch | 10 +++++-----
>  package/luajit/0003-install-so.patch     | 22 ----------------------
>  package/luajit/luajit.hash               |  2 +-
>  package/luajit/luajit.mk                 |  2 +-
>  4 files changed, 7 insertions(+), 29 deletions(-)
>  delete mode 100644 package/luajit/0003-install-so.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
