From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 7 Mar 2015 19:09:29 +0100
Subject: [Buildroot] [PATCH 3/5] package/imlib2: Switch to giflib
In-Reply-To: <XnsA431CDAED142AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-3-git-send-email-bernd.kuhls@t-online.de>
 <8761bsz1n6.fsf@dell.be.48ers.dk>
 <XnsA431CDAED142AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <CAHkwnC_sOVUjGLQmE-=GUCimj69GoRso2uh4BNyemUAR_b55cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 29, 2015 at 8:13 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> [posted and mailed]
>
> Peter Korsgaard <peter@korsgaard.com> wrote in
> news:8761bsz1n6.fsf at dell.be.48ers.dk:
>
>> How about instead bumping our imlib2 version? I see there is some giflib
>> support in upstream git:
>>
>> https://git.enlightenment.org/legacy/imlib2.git/log/
>
> Hi,
>
> bumping to 1.4.6 and backporting some giflib related patches or switching
> directly to the upstream git HEAD is an option, but I am not in a position to
> runtime test the packages depending on imlib2, therefore I chose a way to
> support giflib with a minimum of code changes. I can provide v2 of my patch
> with one of my suggestions but fixing build errors later on will be a
> difficult task for me timewise. What do you suggest?
>
> Since imlib2 1.4.6 was released over a year ago I suppose that there is not a
> big audience for this package in the buildroot community, the only reason I
> touched imlib2 is my desire to get rid of libungif in favour of giflib
> because Kodi 15.0 will depend on it ;)

I've made a patch for bumping it to 1.4.6 and back porting few
upstream patches to support giflib:
http://patchwork.ozlabs.org/patch/447618/
http://patchwork.ozlabs.org/patch/447619/

Sorry but I've found your patch only right before sending mine.

BR
-- 
Fabio Porcedda
