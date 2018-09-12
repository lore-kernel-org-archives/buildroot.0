From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 16:33:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh2: bump version
In-Reply-To: <20180911205613.24701-1-bernd.kuhls@t-online.de>
References: <20180911205613.24701-1-bernd.kuhls@t-online.de>
Message-ID: <20180912163344.532b37ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Sep 2018 22:56:13 +0200, Bernd Kuhls wrote:

> -LIBSSH2_VERSION = 616fd4d1b3e4a55de67c48819fefca83132126b5
> +LIBSSH2_VERSION = 8b870ad771cbd9cd29edbb3dbb0878e950f868ab

Looks like this new version has issues:

  http://autobuild.buildroot.net/?reason=libssh2-8b870ad771cbd9cd29edbb3dbb0878e950f868ab

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
