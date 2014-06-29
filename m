From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:37:15 +0200
Subject: [Buildroot] [PATCH] radvd: bump to version 1.14
In-Reply-To: <1403951632-13338-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403951632-13338-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140629103715.67b48b9c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 28 Jun 2014 07:33:52 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/radvd/radvd.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied, thanks. I've slightly extended the commit log to explain why
the -lrt hack has been removed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
