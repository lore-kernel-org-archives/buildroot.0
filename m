From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Aug 2014 18:30:57 +0200
Subject: [Buildroot] [PATCH 00/12] toolchain: warn for unsafe
 library/header paths
In-Reply-To: <20140821233312.03679844@free-electrons.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53F656E5.9020802@openwide.fr>
 <20140821233312.03679844@free-electrons.com>
Message-ID: <20140822163057.GA3998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-21 23:33 +0200, Thomas Petazzoni spake thusly:
> On Thu, 21 Aug 2014 22:30:29 +0200, Romain Naour wrote:
> > Also, BR_COMPILER_PARANOID_UNSAFE_PATH needs to be renamed to
> > BR2_COMPILER_PARANOID_UNSAFE_PATH to follow the naming scheme ?
> 
> No: BR2_* variables are Config.in options. Environment variables are
> BR_*.

Earlier this year in Brussels, we said we were to use BR2_ everywhere :
    http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014

So Romain is right, that the environment variable should be renamed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
