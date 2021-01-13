From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Jan 2021 22:22:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/c-capnproto: fix tarball hash
In-Reply-To: <20210113211700.GA609249@scaer>
References: <20210112181159.12172-1-fontaine.fabrice@gmail.com>
 <20210113211700.GA609249@scaer>
Message-ID: <20210113212233.GB609249@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-13 22:17 +0100, Yann E. MORIN spake thusly:
> On 2021-01-12 19:11 +0100, Fabrice Fontaine spake thusly:
> > Commit 5b95a5dc27c0d8002c00bda1c867ddea9218087e seems to have made a
> > mistake in the tarball hash
> 
> Actually, I just re-checked locally, and I indeed still get the hash
> currently in the tree.

Ah, but I am able to reproduce the problem with the _host_ variant!

So, the hash is correct when downloading the target variant, but it is
not when downloading the host variant. Woot.. Weird... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
