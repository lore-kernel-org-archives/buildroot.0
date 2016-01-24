From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jan 2016 21:32:44 +0100
Subject: [Buildroot] [PATCH 0/8] Remove uClibc version selection: always
 use uClibc-ng
In-Reply-To: <56A5334E.7070203@gmail.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <56A5334E.7070203@gmail.com>
Message-ID: <20160124213244.1603ba04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sun, 24 Jan 2016 21:25:50 +0100, Romain Naour wrote:

> You can also remove
> package/util-linux/0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
> which was added for uClibc 0.9.33.
> 
> https://git.busybox.net/buildroot/commit/?id=a5a4b38c6a43d9da46cdd0244b1aae07d7bcce5c

Good point. I'll add this patch to the series if I send a v2 following
other comments. Otherwise, I'll send a separate patch to do this, once
this series gets merged.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
