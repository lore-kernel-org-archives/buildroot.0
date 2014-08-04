From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:29:31 +0200
Subject: [Buildroot] [PATCH 0/9 v4] Cleanups in download helpers (branch
 yem/check-downloads)
In-Reply-To: <cover.1407088287.git.yann.morin.1998@free.fr>
References: <cover.1407088287.git.yann.morin.1998@free.fr>
Message-ID: <20140804202931.7e3f165b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Aug 2014 19:53:38 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (9):
>       support/download: add download wrapper
>       support/download: convert bzr to use the wrapper
>       support/download: convert localfiles to use the wrapper
>       support/download: convert cvs to use the wrapper
>       support/download: convert git to use the wrapper
>       support/download: convert Hg to use the wrapper
>       support/download: convert scp to use the wrapper
>       support/download: convert svn to use the wrapper
>       support/download: convert wget to use the wrapper

Series applied. Thanks for your work, and thanks a lot to Thomas DS for
the testing.

I've also tested it here locally with a few packages (using wget, git,
bzr and svn) while pointing to an empty BR2_DL_DIR, and it worked fine.
Let's see if it survives the autobuilder testing :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
