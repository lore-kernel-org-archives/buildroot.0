From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 12 Nov 2014 09:57:02 +0000
Subject: [Buildroot] [PATCH] alsa-utils: fix linking with intl
In-Reply-To: <87ppctmpm8.fsf@dell.be.48ers.dk>
References: <1415721082-15809-1-git-send-email-Vincent.Riera@imgtec.com>
 <87ppctmpm8.fsf@dell.be.48ers.dk>
Message-ID: <54632EEE.6080404@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On 11/11/2014 08:47 PM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > alsa-utils needs to link with intl if the toolchain needs gettext and
>  > locale is set. Otherwise we will see an error like this one:
> 
>  > option.o: In function `canonicalise_opt':
>  > option.c:(.text+0x3bc): undefined reference to `libintl_gettext'
> 
>  > Fixes:
>  >   http://autobuild.buildroot.net/results/276/276581f6dbbe330799c3a7eaa26b453e38a22907/
> 
> That autobuild link and the error message refers to an issue with
> dnsmasq, but the patch seems OK so I've committed with a reference to
> this autobuild issue instead:
> 
> http://autobuild.buildroot.net/results/707/707016a2490fc97b98d17e2b6a9c6423a56bb4a9/
> 

sorry about that. I had too many tabs opened in my Chromium :-(

Thanks for fixing it.

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
