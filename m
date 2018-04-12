From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:49:35 +0200
Subject: [Buildroot] [PATCH 1/1] tcf-agent: bump to version 1.7.0
In-Reply-To: <20180412151310.15252-1-eugene@largest.net>
References: <20180412151310.15252-1-eugene@largest.net>
Message-ID: <20180412234935.3ae48694@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 08:13:10 -0700, Eugene Tarassov wrote:
> Build issues with MicroBlaze and PPC64 targets are fixed
> 
> Signed-off-by: Eugene Tarassov <eugene@largest.net>

Thanks Eugene for this patch. However, Norbert had already sent a patch
to bump to 1.7.0, and his patch raised a number of questions that
haven't been answered:

  http://patchwork.ozlabs.org/patch/880414/

In particular, Norbert submission was adding two patches to fix build
issues, and doing a lot more changes in tcf-agent.mk. I'm wondering why
your patch is so different, and doesn't include Norbert changes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
