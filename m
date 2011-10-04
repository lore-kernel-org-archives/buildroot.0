From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 04 Oct 2011 13:52:30 +0200
Subject: [Buildroot] [PATCH 1/3] new package: gssdp
In-Reply-To: <87mxegjfqs.fsf@macbook.be.48ers.dk>
References: <1312965667-15157-1-git-send-email-s.neumann@raumfeld.com>
 <87mxegjfqs.fsf@macbook.be.48ers.dk>
Message-ID: <1317729340.2527.0.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-09-07 at 21:48 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> GSSDP implements resource discovery and announcement over SSDP.
> 
> Thanks, but it doesn't build on uClibc with default configs:
> 
> gssdp-client.c:45:21: error: ifaddrs.h: No such file or directory
> 
> ifaddrs.h is only provided if CONFIG_SUPPORT_AI_ADDRCONFIG is enabled,
> which it isn't by default. We'll probably need to add something like
> BR2_USE_WCHAR, but I'll do a test build to see what the performance
> impact is.

Did you ever get around to do this test build?


Regards,
Sven
