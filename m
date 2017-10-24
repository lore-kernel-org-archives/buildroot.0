From: Christian Stewart <christian@paral.in>
Date: Mon, 23 Oct 2017 23:24:22 -0400
Subject: [Buildroot] [RFC, v2,
	2/4] package/pkg-golang: new package infrastructure
In-Reply-To: <CA+TH9Vny5An_ktJCRFZiN5RFok0QuaSF9a1GKOsHyiV--huO-g@mail.gmail.com>
References: <CA+h8R2p_8jhZqP2NLcSz0mXZ7WbrWSKnV8ML78U29CsTCk_Q=g@mail.gmail.com>
 <CA+TH9Vny5An_ktJCRFZiN5RFok0QuaSF9a1GKOsHyiV--huO-g@mail.gmail.com>
Message-ID: <CA+h8R2rgrwFfW4R7xLncVEbT=RYfU2Zfetx+qQ9m8AUHNQHEWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

On Mon, Oct 23, 2017 at 11:50 AM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
>> - Is  CGO_NO_EMULATION=1  necessary? I use it in docker-engine, not sure why.
>
> Unfortunately I cannot find any information about this variable or
> google nor the manual. I don't think it makes something.

https://github.com/LibreELEC/LibreELEC.tv/pull/1669/files#diff-3fa55ea381e3943a7d8440c8adbb6bb1R40

But, you're right, I can't find it anywhere else.

> It is already provided by the GO_FOO_GO_SRC_PATH variable.
> Btw I think that there is no problem in guessing the path cause all
> the projects I worked with use the domain/vendor/software convention.

It looked to me like it was being overwritten but I may be wrong.


> I will do a respin of the series with the runc package converted to
> the golang infrastructure and you will find it much smaller!

Looking forward to it!

Best,
Christian
