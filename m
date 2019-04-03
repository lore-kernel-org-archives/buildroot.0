From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 23:13:56 +0200
Subject: [Buildroot] [PATCH 0/2] [AUTOBUILD] Store package files list in
 results (branch yem/files-list)
In-Reply-To: <cover.1554054435.git.yann.morin.1998@free.fr>
References: <cover.1554054435.git.yann.morin.1998@free.fr>
Message-ID: <20190403231356.77a41b10@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sun, 31 Mar 2019 19:48:20 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yann E. MORIN (2):
>       [AUTOBUILD] autobuild-run: add helper function to copy-if-exists
>       [AUTOBUILD] autobuild-run: also copy packages files lists if they exist

Both applied. I hope those additional files will not be too big: we
keep all those files for all build results, so it can add up quite a
bit over time. The build results currently take 64 GB of disk space,
and require 1303600 files.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
