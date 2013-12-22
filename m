From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Sun, 22 Dec 2013 20:29:36 -0300
Subject: [Buildroot] [PATCH] binutils: do not allow on NIOS2,
	no support available
In-Reply-To: <1387737088-15963-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1387737088-15963-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131222232935.GA2410@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 22, 2013 at 07:31:28PM +0100, Thomas Petazzoni wrote:
> binutils does not have support for NIOS2 on the target, so disable the
> selection of binutils on this architecture.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/40d/40d9cbefd03727af82610412ed0bc47674c44dbb/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
