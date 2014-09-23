From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 22:18:38 +0200
Subject: [Buildroot] [PATCH] gnuplot: bump to version 4.6.6
In-Reply-To: <5421D457.2090708@zacarias.com.ar>
References: <1411483294-9742-1-git-send-email-gustavo@zacarias.com.ar>
 <20140923215610.0e46e6b7@free-electrons.com>
 <5421D457.2090708@zacarias.com.ar>
Message-ID: <20140923221838.63051980@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 23 Sep 2014 17:13:11 -0300, Gustavo Zacarias wrote:
> On 09/23/2014 04:56 PM, Thomas Petazzoni wrote:
> 
> > Could you have a look at http://patchwork.ozlabs.org/patch/375696/, and
> > give some Tested-by/Acked-by if applicable? The patch is gnuplot
> > related.
> 
> I'll take a look, but the patch is incorrect so it needs some fixing.
> The offending library there is fontconfig which has optional usage of
> libpthread, which in turn is also optional for libgd so forcing
> -lpthread in isn't correct.

I was pretty sure the patch wasn't correct. But the issue exists, so if
you have some time to take a look, that'd be great.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
