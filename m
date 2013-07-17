From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jul 2013 19:07:03 +0200
Subject: [Buildroot] [PATCHv2 3/4] toolchain/toolchain-external: don't
 use x$(...) construct or ==
In-Reply-To: <1374048801-7666-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1374048801-7666-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1374048801-7666-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130717170703.GC3385@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-17 10:13 +0200, Thomas Petazzoni spake thusly:
> With modern shells, we can simply do test using the "$(...)" = "value"
> form. This commit gets rid of the x$(...) = x"value" constructs and
> replaces == by =, which is the correct operator to test the equality
> of two strings with the test program.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
