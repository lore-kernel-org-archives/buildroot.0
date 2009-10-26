From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Mon, 26 Oct 2009 13:20:19 +0100
Subject: [Buildroot] Autoconf still not building (M4 ) results
In-Reply-To: <87a5b0800910260511ta958c1ehaaae17914a5792a2@mail.gmail.com>
References: <1531E53627F1F749B4FE809BF2A4EB67013CF4C7@WETMEX10.loepfe.com>
	<87a5b0800910260335v1849578y2dadfde9b4a91b22@mail.gmail.com>
	<1531E53627F1F749B4FE809BF2A4EB67013CF69D@WETMEX10.loepfe.com>
	<87a5b0800910260448i2c2d815ep6d16409288fb63e2@mail.gmail.com>
	<1531E53627F1F749B4FE809BF2A4EB67013CF6E1@WETMEX10.loepfe.com>
	<87a5b0800910260511ta958c1ehaaae17914a5792a2@mail.gmail.com>
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67013CF704@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,

I can confirm .

/bin/sh -> fails !! (just re-tested it to be sure it still fails, and it
does fail)

/bin/bash -> is SUCCESS !!


Regards Noel.


 

-----Original Message-----
From: Will Newton [mailto:will.newton at gmail.com] 
Sent: 26Oct09 13:12
To: Vellemans, Noel
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Autoconf still not building (M4 ) results

On Mon, Oct 26, 2009 at 12:58 PM, Vellemans, Noel
<Noel.Vellemans@visionbms.com> wrote:
> < Will > Hmm, well that's one theory that down. What distribution are 
> you running? What is your /bin/sh (/bin/sh --version)?
>
>
>
> /$ /bin/sh --version
> /bin/sh: Illegal option --
>
> I already was looking this way .. but :-( no version ..
> It is a Ubuntu 9.04 system (with the latest patches) ..
> [ at this time it is reported to happen on Ubuntu and non-stable
debian.
> ]
>
>
> $ uname -a
> Linux bmslin0003-2 2.6.28-15-generic #52-Ubuntu SMP Wed Sep 9 10:49:34

> UTC 2009 i686 GNU/Linux
>
> $
>
>
> Need more info ? Don't hesitate ..

Could you try changing the top line of the configure from /bin/sh to
/bin/bash?
