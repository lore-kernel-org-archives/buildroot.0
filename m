From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Sep 2012 00:57:14 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	gettext-rework
In-Reply-To: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
References: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201209020057.14408.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 19 July 2012 23:20:59 Thomas Petazzoni wrote:
> Here is a set of patches that builds on top of the work from Maxime
> Ripard and Samuel Martin to clean up how gettext is handled, and in
> the end migrate the gettext package to the autotools-package
> infrastructure.

I am currently looking at this patchset. Globally, I'm OK with most of it,
except for some minor picks.

I am also almost finished doing the GETTEXT select rework I wrote about
yesterday, and will push an updated patchset with your patches, and mine
on-top of them.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
