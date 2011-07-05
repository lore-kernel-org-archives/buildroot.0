From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 5 Jul 2011 23:28:43 +0200
Subject: [Buildroot] [PATCH 13/28] syslinux: convert to GENTARGETS
In-Reply-To: <20110705214602.3b2c2dad@skate>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <201107050012.31481.yann.morin.1998@anciens.enib.fr>
 <20110705214602.3b2c2dad@skate>
Message-ID: <201107052328.43306.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 05 July 2011 21:46:02 Thomas Petazzoni wrote:
> Le Tue, 5 Jul 2011 00:12:31 +0200,
> "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :
> 
> > You're doing two unrelated chances here:
                                   ^
Hmmm... Maybe I should re-read myself before posting... :-]

> Before, we add:
> 
>  * an option to enable isolinux
>  * an option to enable pxelinux
> 
> But this isn't compatible with GENTARGETS because with GENTARGETS, we
> need a single option that enables/disables the package, and other
> options should be suboptions. Which is why we now have :
> 
>  * an option to enable syslinux
>    * a suboption to enable isolinux
>    * a suboption to enable pxelinux
> 
> I could have done this option change *before* doing the GENTARGETS
> conversion, but honestly, I didn't want to mess up with the existing
> makefile code before converting it to GENTARGETS.

Granted. Doing both in one go is thus understandable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
