From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Feb 2015 22:51:36 +0100
Subject: [Buildroot] [PATCH 1/2] boards/raspberrypi: update instructions
 for Raspberry Pi 2
In-Reply-To: <87lhjk5ot9.fsf@dell.be.48ers.dk>
References: <1424817743-3627-1-git-send-email-yann.morin.1998@free.fr>
 <87lhjk5ot9.fsf@dell.be.48ers.dk>
Message-ID: <20150226215136.GD3914@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-02-26 22:46 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> > diff --git a/board/raspberrypi2 b/board/raspberrypi2
>  > new file mode 120000
>  > index 0000000..fcdafc8
>  > --- /dev/null
>  > +++ b/board/raspberrypi2
>  > @@ -0,0 +1 @@
>  > +raspberrypi
>  > \ No newline at end of file
> 
> I don't know if it is patchwork, but this ended up as a symlink to 'raspberrypi?'

Yes, Patchwork is picky with symlinks. This already hapenned quite a few
times recently. Remember the website move?

> Committed to next with those issues fixed, thanks.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
