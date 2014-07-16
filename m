From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jul 2014 22:07:43 +0200
Subject: [Buildroot] [PATCH] perl-net-ssleay: fix configure
In-Reply-To: <CAB0FRss71Yq479qyc02bZXx+fvtVCXkFwAC0k0JLkeQxFuK7iQ@mail.gmail.com>
References: <1405381684-3844-1-git-send-email-yann.morin.1998@free.fr>
 <53C61864.4080003@mind.be>
 <CAB0FRss71Yq479qyc02bZXx+fvtVCXkFwAC0k0JLkeQxFuK7iQ@mail.gmail.com>
Message-ID: <20140716200743.GG9252@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-07-16 19:42 +0200, Fran?ois Perrad spake thusly:
> Net-SSLeay has a Makefile.PL, but it doesn't use to run the classic
> ExtUtils-MakeMaker,
> it runs a local copy of Module-Install, see in inc/

Ah! Thanks for the explanations. Indeed, that's bad...

Would it be possible to make it use the system perl's MakeMaker instead
of its own copy? For example, if we were to just remove it?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
