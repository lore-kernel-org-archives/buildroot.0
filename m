From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Sep 2016 12:29:22 +0200
Subject: [Buildroot] [PATCH 0/9 v4] br2-external: support multiple trees
 at once (branch yem/multi-br2-external-10)
In-Reply-To: <cover.1473109655.git.yann.morin.1998@free.fr>
References: <cover.1473109655.git.yann.morin.1998@free.fr>
Message-ID: <20160906102922.GA5609@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

On 2016-09-05 23:49 +0200, Yann E. MORIN spake thusly:
> This rather complex series introduces support for using multiple
> br2-external trees at once.
[--SNIP--]
> This series is an attempt at making it possible to use such setups.
[--SNIP--]

I've made a few br2-external trees available for testing this series:
    http://ymorin.is-a-geek.org/git/br2-external-tests/

There's a README that explains the purpose of each tree in that repo.

I tried to cover all basic cases, but there are probably caveats and
stuff that is not covered.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
