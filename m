From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Sep 2019 22:28:13 +0200
Subject: [Buildroot] [PATCH] package/libkrb5: Bumb to 1.17
In-Reply-To: <20190930221815.6d06ffcb@windsurf.home>
References: <20190930113931.9654-1-nerv@dawncrow.de>
 <20190930221815.6d06ffcb@windsurf.home>
Message-ID: <20190930202813.GA10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-09-30 22:18 +0200, Thomas Petazzoni spake thusly:
> On Mon, 30 Sep 2019 13:39:31 +0200
> Andr? Hentschel <nerv@dawncrow.de> wrote:
> > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
[--SNIP--]
> However, I think this package license information may not be totally
> correct, independently of this version bump. Indeed, our libkrb5.mk
> says the license is MIT, but the NOTICE file shows a bunch of parts
> under BSD-2-Clause for example.
> 
> Arnout, Yann, what do you think about this? It's one of those packages
> with lots of code re-used from different projects, all under
> MIT/BSD-2-Clause style licenses. I'd be interested to hear your opinion
> on the matter.

Looking at the haorball the NOTICE file is, I would be tempted to just
state:
    LIBKRB5_LICENSE = Kerberos license

and be done with it. Let the user sort the mess on their side...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
