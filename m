From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Tue, 2 Mar 2021 09:11:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v6.2.0
In-Reply-To: <87wnuqq2go.fsf@dell.be.48ers.dk>
References: <20210301143700.253226-1-titouanchristophe@gmail.com>
 <87wnuqq2go.fsf@dell.be.48ers.dk>
Message-ID: <d2736239-f814-13f8-73bc-a6ab61e99ed9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On 1/03/21 17:10, Peter Korsgaard wrote:
>>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:
> 
>   > This version also needs a patch from upstream to compile on musl systems.
>   > From the release notes:
>   > ================================================================================
>   > Redis 6.2.0 GA  Released Tue Feb 22 14:00:00 IST 2021
>   > ================================================================================
> 
> Why not upgrade to 6.0.11 instead? Given how close we are to 2021.02, I
> would prefer to not move to a new major version.
> 

Indeed, thank you for pointing that out. In the meantime, upstream also 
released 6.0.12, containing a backport of the patch we needed here. I'm 
sending a v2 now.

Best regards,
Titouan
