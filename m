From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Aug 2014 13:22:18 +0200
Subject: [Buildroot] [PATCH 00/12] toolchain: warn for unsafe
 library/header paths
In-Reply-To: <c4d57675-8499-4727-bdc1-4d8d772b6096@email.android.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53F656E5.9020802@openwide.fr>
 <20140821233312.03679844@free-electrons.com>
 <20140822163057.GA3998@free.fr>
 <c4d57675-8499-4727-bdc1-4d8d772b6096@email.android.com>
Message-ID: <20140824112218.GA3778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2014-08-22 21:29 +0200, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >Thomas, All,
> >
> >On 2014-08-21 23:33 +0200, Thomas Petazzoni spake thusly:
> >> On Thu, 21 Aug 2014 22:30:29 +0200, Romain Naour wrote:
> >> > Also, BR_COMPILER_PARANOID_UNSAFE_PATH needs to be renamed to
> >> > BR2_COMPILER_PARANOID_UNSAFE_PATH to follow the naming scheme ?
> >> 
> >> No: BR2_* variables are Config.in options. Environment variables are
> >> BR_*.
> >
> >Earlier this year in Brussels, we said we were to use BR2_ everywhere :
> >    http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014
> 
> Hmm, that is written in the conclusion, but this is very
>  different than what is in the 'proposed rules'.
> Was it really the final outcome to use BR2 for all types
>  of variable? I thought we wanted to make a
>  distinction between config variables and others...

Yes, I was a bit surprised by the conclusion, too.
From what I remember, I thought we decided for:
  - user-facing variables: prefix with BR2_
  - internal variables: prefix with BR_

IIRC, we already have a few changesets implementing those rules.

For example:
    35c666e toolchain/wrapper: rename BR_DEBUG_WRAPPER

(I could not find another reverse such change, unfortunetely...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
