From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Mon, 26 Oct 2009 12:58:36 +0100
Subject: [Buildroot] Autoconf still not building (M4 ) results
In-Reply-To: <87a5b0800910260448i2c2d815ep6d16409288fb63e2@mail.gmail.com>
References: <1531E53627F1F749B4FE809BF2A4EB67013CF4C7@WETMEX10.loepfe.com>
	<87a5b0800910260335v1849578y2dadfde9b4a91b22@mail.gmail.com>
	<1531E53627F1F749B4FE809BF2A4EB67013CF69D@WETMEX10.loepfe.com>
	<87a5b0800910260448i2c2d815ep6d16409288fb63e2@mail.gmail.com>
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67013CF6E1@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

< Will > Hmm, well that's one theory that down. What distribution are
you running? What is your /bin/sh (/bin/sh --version)?



/$ /bin/sh --version
/bin/sh: Illegal option --

I already was looking this way .. but :-( no version .. 
It is a Ubuntu 9.04 system (with the latest patches) .. 
[ at this time it is reported to happen on Ubuntu and non-stable debian.
]


$ uname -a
Linux bmslin0003-2 2.6.28-15-generic #52-Ubuntu SMP Wed Sep 9 10:49:34
UTC 2009 i686 GNU/Linux

$ 


Need more info ? Don't hesitate .. 

Regards noel.
 

-----Original Message-----
From: Will Newton [mailto:will.newton at gmail.com] 
Sent: 26Oct09 12:49
To: Vellemans, Noel
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Autoconf still not building (M4 ) results

On Mon, Oct 26, 2009 at 11:57 AM, Vellemans, Noel
<Noel.Vellemans@visionbms.com> wrote:
> Hello ...
>
> <Will >Hi Noel,
>
> <Will >What locale are you running with? i.e., what is the output of 
> "locale"
> <Will >on your development machine?
>
>
> Plse find the output of locale ...
> $ locale
> LANG=en_US.UTF-8
> LC_CTYPE="en_US.UTF-8"
> LC_NUMERIC="en_US.UTF-8"
> LC_TIME="en_US.UTF-8"
> LC_COLLATE="en_US.UTF-8"
> LC_MONETARY="en_US.UTF-8"
> LC_MESSAGES="en_US.UTF-8"
> LC_PAPER="en_US.UTF-8"
> LC_NAME="en_US.UTF-8"
> LC_ADDRESS="en_US.UTF-8"
> LC_TELEPHONE="en_US.UTF-8"
> LC_MEASUREMENT="en_US.UTF-8"
> LC_IDENTIFICATION="en_US.UTF-8"
> LC_ALL=

Hmm, well that's one theory that down. What distribution are you
running? What is your /bin/sh (/bin/sh --version)?
