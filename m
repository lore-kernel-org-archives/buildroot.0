From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 22:29:59 +0200
Subject: [Buildroot] [PATCH] package: don't use BR2_KERNEL_MIRROR for
 git downloads
In-Reply-To: <20200524085721.641-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 24 May 2020 10:57:21 +0200")
References: <20200524085721.641-1-yann.morin.1998@free.fr>
Message-ID: <87lflfiwqg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The git repositories are not served on the kernel.org CDN:
 >     fatal: repository 'https://cdn.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/' not found

 > Switch to explicitly use the git.kernel.org server.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Cc: Cyril Bur <cyrilbur@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
