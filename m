From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 11:46:34 +0200
Subject: [Buildroot] [PATCH] toolchain-external: drop reference to
 non-existing variable
In-Reply-To: <e2b199b7fd2f97c0689cf643ba191cd013ae8f35.1499315280.git.baruch@tkos.co.il>
References: <e2b199b7fd2f97c0689cf643ba191cd013ae8f35.1499315280.git.baruch@tkos.co.il>
Message-ID: <20170706114634.01275f78@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Jul 2017 07:28:00 +0300, Baruch Siach wrote:
> Commit 32bec8ee2fb0 (toolchain-external: copy ld*.so* for all C libraries)
> removed the definition of TOOLCHAIN_EXTERNAL_MUSL_LD_LINK. Remove also the
> reference to it.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> This addresses my comment on the patch.
> http://lists.busybox.net/pipermail/buildroot/2017-July/195993.html

Sorry, I saw your comment, and it was definitely right. But we have
been reviewing/merging so many patches, and discussing so many topics
that I forgot to take into account your comment.

I've applied your patch now. Thanks for reviewing and fixing this
mistake.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
