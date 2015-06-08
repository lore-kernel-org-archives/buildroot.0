From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Jun 2015 00:24:36 +0200
Subject: [Buildroot] [PATCH 02/11] docs/manual: add kernel-module
In-Reply-To: <557610ED.9060408@mind.be>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <5c16fb51d4dd1fdf8d5660ccc2121895f28ca17c.1433628825.git.yann.morin.1998@free.fr>
 <55760D21.9080107@mind.be> <557610ED.9060408@mind.be>
Message-ID: <20150608222436.GJ3590@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-06-09 00:02 +0200, Arnout Vandecappelle spake thusly:
> On 06/08/15 23:46, Arnout Vandecappelle wrote:
> > On 06/07/15 00:20, Yann E. MORIN wrote:
[--SNIP--]
> >> +01: ################################################################################
> >> +02: #
> >> +03: # foo
> >> +04: #
> >> +05: ################################################################################
> >> +06: 
> >> +07: FOO_VERSION = 1.2.3
> >> +08: FOO_SOURCE = foo-$(FOO_VERSION).tar.xz
> >> +09: FOO_SITE = http://www.foosoftware.org/download
> 
>  One more thing: we want to encourage adding license info, so perhaps include in
> the example:
> 
> FOO_LICENSE = GPLv2
> FOO_LICENSE_FILES = COPYING

That and your previous comments acted upon. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
