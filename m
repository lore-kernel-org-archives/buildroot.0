From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:35:27 +0200
Subject: [Buildroot] [PATCH v5 1/8] package/kodi: lib/cximage-6.0: fix
 compilation with gcc6
In-Reply-To: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160717143527.395f74a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jul 2016 20:08:55 +0200, Bernd Kuhls wrote:

> +Subject: [PATCH 7/7] lib/cximage-6.0: fix compilation with gcc6

One quick thing: please generate patches against Buildroot packages
with "git format-patch -N" so that the prefix is just [PATCH] and not
[PATCH 7/7].

I fixed that up when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
