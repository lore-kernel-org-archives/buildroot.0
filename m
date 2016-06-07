From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 22:27:18 +0200
Subject: [Buildroot] [PATCH 0/7] fs: cleanups (branch yem/fs-fixes)
In-Reply-To: <cover.1465245732.git.yann.morin.1998@free.fr>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
Message-ID: <20160607222718.5646d4bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Jun 2016 22:43:40 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (7):
>       core/pkg-utils: add macro to escape-and-printf
>       fs: properly escape commands when generating fakeroot script
>       fs/cloop: split long line
>       fs/jffs2: split commands
>       fs/squashfs: split commands
>       fs/ubifs: fix the UBI commands
>       fs/squashfs: remove useless chmod

Entire series applied, thanks! I had already applied one patch, I've
simply applied all remaining ones.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
