From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 14:32:15 +0100
Subject: [Buildroot] [PATCH] uclibc: Fix system calls on openrisc
In-Reply-To: <20171212232904.23365-1-joel@jms.id.au>
References: <20171212232904.23365-1-joel@jms.id.au>
Message-ID: <20171213143215.71d0b501@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Dec 2017 09:59:04 +1030, Joel Stanley wrote:
> This adds a patch from the master branch that fixes userspace calling
> through uclibc when making system calls.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  ...-or1k-syscall-Pass-arguments-on-the-stack.patch | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 package/uclibc/0001-or1k-syscall-Pass-arguments-on-the-stack.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
