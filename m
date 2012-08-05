From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Aug 2012 11:42:33 +0200
Subject: [Buildroot] [PATCH 1/9] [luajit] add license info
In-Reply-To: <1344149563-20917-1-git-send-email-francois.perrad@gadz.org>
References: <1344149563-20917-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120805114233.3aab2ad2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun,  5 Aug 2012 08:52:35 +0200,
Francois Perrad <fperrad@gmail.com> a ?crit :

> ---
>  package/luajit/luajit.mk |    2 ++
>  1 file changed, 2 insertions(+)

Thanks, but please redo all your patches with:

 * A title like "<pkgname>: add license info". The package name should
   *NOT* be between [], otherwise Git removes it when applying the
   patch.

 * A Signed-off-by line the commit log of each patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
