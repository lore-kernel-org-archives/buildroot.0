From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 14 Feb 2014 23:52:49 +0100
Subject: [Buildroot] [PATCH v13 0/7] Add support for top-level parallel
	make
In-Reply-To: <87vbwhl9ym.fsf@dell.be.48ers.dk>
References: <1392371709-26662-1-git-send-email-fabio.porcedda@gmail.com>
 <87d2ipmp3l.fsf@dell.be.48ers.dk>
 <CAAXf6LVKsGPsEB19myfj_BvDaW8BKz=Rd3gW-4iX12O+L1XThA@mail.gmail.com>
 <87vbwhl9ym.fsf@dell.be.48ers.dk>
Message-ID: <CAHkwnC_KHZ7oK6mCof+Xq36kmPT_G_q1dpNFBXfpSFfY5KQ7ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 14, 2014 at 9:23 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  >> > v13:
>  >> >  - Modified the "package: add support for top-level parallel make"
>  >> >    patch, improved a comment and spliting the $$($(2)_TARGET_BUILD)
>  >> >    dependency as suggested by Arnout.
>  >> >  - Modified the sdl patch to use SDL_PRE_CONFIGURE_HOOKS as suggested
>  >> >    by Thomas P.
>  >>
>  >> Committed series to next, thanks for your persistence!
>
>  > A bottle of champagne, please!
>
> ;) It fits today, doesn't it?

Yeah it fits.

It was finally merged, that's great!
I was losing hope!
My first patch about this feature was sent in April 2013, ten months ago...

I will do more testing, so except more patches to improve the support.

Regards
-- 
Fabio Porcedda
