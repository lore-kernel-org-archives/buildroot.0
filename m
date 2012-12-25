From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Dec 2012 18:06:06 +0100
Subject: [Buildroot] [PATCH] package/spice: don't enable GUI if
	dependencies not met
In-Reply-To: <1356389114-9826-1-git-send-email-yann.morin.1998@free.fr>
References: <1356389114-9826-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <201212251806.07042.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Monday 24 December 2012 Yann E. MORIN wrote:
> The spice GUI selects unconditionally selects cegui06, but cegui06 requires
> threads and C++, so spice GUI must also depend on threads and C++.

Please disregard this patch.
I'll be sending a pull request for a few build-fixes tonight, of which
this one...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
