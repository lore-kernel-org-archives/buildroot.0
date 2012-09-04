From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Sep 2012 00:38:53 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	uclibc-arch-type-cleanup
In-Reply-To: <cover.1346766545.git.thomas.petazzoni@free-electrons.com>
References: <cover.1346766545.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201209050038.53754.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 04 September 2012 15:49:42 Thomas Petazzoni wrote:
> Here is a simple patch set that moves BR2_ARM_TYPE and BR2_SPARC_TYPE
> to a uClibc-specific place, since those are uClibc specific.

This series will come clashing with your reorganising you sent later.

What's your plan with those two? Apply this series first, or the other one?

I personaly think we should work on the other series first, then add this
one after. You could probably aggregate those two series as a single one.

Regards,
Yann E. MORIN.

PS. Reviewing takes time! I used my whole evening reviewing those two series!
Pfew... ;-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
