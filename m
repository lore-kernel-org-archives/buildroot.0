From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 22:15:53 +0100
Subject: [Buildroot] [PATCH] toolchain/toolchain-buildroot: glibc 2.32
 for ARC needs linux-headers >= 5.1.0
In-Reply-To: <20201207224719.3603067-1-romain.naour@gmail.com>
References: <20201207224719.3603067-1-romain.naour@gmail.com>
Message-ID: <20201229221553.52a62c3f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Dec 2020 23:47:19 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> The ARC support has been merged into glibc 2.32 but it requires
> linux-headers >= 5.1.0 [1].
> 
> Fixes:
> https://gitlab.com/kubu93/toolchains-builder/-/jobs/895774971
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=0be8ae3679570ff9a193615a035fc8074a8c704f
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: ARC Maintainers <arc-buildroot@synopsys.com>
> ---
>  toolchain/toolchain-buildroot/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
