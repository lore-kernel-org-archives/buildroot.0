From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 7 Aug 2011 21:36:17 +0200
Subject: [Buildroot] [PATCH 1/2] toochain/crosstool-NG: bump version
In-Reply-To: <87sjpdkonq.fsf@macbook.be.48ers.dk>
References: <1312744789-21603-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <1312744789-21603-2-git-send-email-yann.morin.1998@anciens.enib.fr>
 <87sjpdkonq.fsf@macbook.be.48ers.dk>
Message-ID: <201108072136.17710.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Sunday 07 August 2011 21:27:37 Peter Korsgaard wrote:
>  Yann> +-ifneq ($(MAKELEVEL),0)
>  Yann> ++ifneq ($(MAKELEVEL),2)
> 
> Doesn't this then break for in-tree builds? 

D'oh...
/me slaps own cheek

> How about just removing these 3 lines instead?

Well, the installation of crosstool-NG as the toolchain backend never
requires manualy running, hence autocompletion should never ever be
attempted, so we should not have to protect ourselves against this, indeed.

I'll repush shortly...

Thanks for pointing this out.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
