From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 26 Feb 2014 10:11:17 +0000
Subject: [Buildroot] [PATCH] vlc: fix some configure options
In-Reply-To: <87ob1uhk68.fsf@dell.be.48ers.dk>
References: <1393360566-4849-1-git-send-email-spdawson@gmail.com>
 <87sir6hklp.fsf@dell.be.48ers.dk> <87ob1uhk68.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCMj+vSa4htd5Q=mbAG=VZq=fpt1s0ubQFP2u4rYQ0FFhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 25 February 2014 23:00, Peter Korsgaard <peter@korsgaard.com> wrote:
>  > Did you test these?

Yes, I did.

> Ahh, now I get it. Our autoreconf somehow converts all those --enable /
> --disable to --with / --without.

Yes, exactly so.

> Anybody that has any idea why this is so? It quite unfortunate as we
> will have to change all of this back once we bump the vlc version and no
> longer need VLC_AUTORECONF = YES.

I haven't yet got to the bottom of how/why this is happening, I'm afraid.

Simon.
