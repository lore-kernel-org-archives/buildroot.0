From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 10:27:13 +0200
Subject: [Buildroot] .br2-external files
In-Reply-To: <CANxTyt45hu0Apyctnoc9a5n25FTwFrddcNta0u-9e7Tw4AjLnQ@mail.gmail.com>
References: <CANxTyt45hu0Apyctnoc9a5n25FTwFrddcNta0u-9e7Tw4AjLnQ@mail.gmail.com>
Message-ID: <20200508082713.GL12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2020-05-04 17:04 -0400, Danomi Manchego spake thusly:
> Hi all,
> 
> I noticed that the
> https://buildroot.org/downloads/buildroot-2020.02.1.tar.bz2 has these
> files in it:
> 
> $ ls -1 .br2*
> .br2-external.in.jpeg
> .br2-external.in.menus
> .br2-external.in.openssl
> .br2-external.in.paths
> .br2-external.in.toolchains
> .br2-external.mk
> 
> But when I look at the 2020.02.x tag in git, those files are not there.
> These are derived files, yes?  Are they expected to be in the release tarball?

Indeed they should not be there. They should not be a problem in
practice, but this is not clean. I'll send a patch.

Thanks for the feedback,

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
