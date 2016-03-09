From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Mar 2016 22:59:03 +0100
Subject: [Buildroot] [PATCH] toolchain: switch linaro to https urls
In-Reply-To: <87vb4vxquc.fsf@dell.be.48ers.dk>
References: <1457552439-8185-1-git-send-email-jason.abele@gmail.com>
 <20160309214256.GA5634@free.fr> <87vb4vxquc.fsf@dell.be.48ers.dk>
Message-ID: <20160309215903.GB5634@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-03-09 22:51 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Jason, All,
>  > On 2016-03-09 11:40 -0800, Jason Abele spake thusly:
>  >> From: Jason Abele <jason@nextthing.co>
>  >> 
>  >> Signed-off-by: Jason Abele <jason@nextthing.co>
> 
>  > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>  >> ---
>  >> It looks like releases.linaro.org is no longer available without ssl.
>  >> If this change is permanent, we should probably fix the urls.
> 
>  > Even if the http URLs return to operational in the future, we want
>  > to keep the https ones anyway.
> 
> Do we? With the package hashes, https doesn't really buy anything, and
> we sometimes have issues with certificates and (old versions) wget.

Well, except for oldish wget and new certs, https i sbetter, not because
it provides authentication of the downloads (which is what our hashes
are for), but because it also /conceals/ the actual download from prying
eyes.

BTW, we have 131 packages on https, plus the 292 Github-hosted packages
also on https. ;-)

So yes, https is better than http. Always.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
