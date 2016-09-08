From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 21:59:25 +0200
Subject: [Buildroot] [PATCH] package/php: explicitly disable phpdbg.
In-Reply-To: <1473321189-18197-1-git-send-email-theo.debrouwere@skynet.be>
References: <20160907171607.GA4759@free.fr>
 <1473321189-18197-1-git-send-email-theo.debrouwere@skynet.be>
Message-ID: <20160908215925.340680da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Sep 2016 09:53:09 +0200, Theo Debrouwere wrote:
> When building php, the package will also build/install phpdbg.
> This patch explicitly disables this behaviour.
> 
> Signed-off-by: Theo Debrouwere <t.debrouwere@televic.com>
> ---
>  package/php/php.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
