From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 23:25:10 +0100
Subject: [Buildroot] [PATCH] linux: Build and install kernel selftests
In-Reply-To: <20151222091859.1b3de5c0@camb691>
References: <1448409222-4510-1-git-send-email-cyrilbur@gmail.com>
 <1448409222-4510-2-git-send-email-cyrilbur@gmail.com>
 <20151214221846.GD4152@free.fr> <20151217124506.616549d9@camb691>
 <20151217180735.GA3653@free.fr> <20151221164401.4007ce33@camb691>
 <20151221092513.GA3454@free.fr> <20151222091859.1b3de5c0@camb691>
Message-ID: <20151221222510.GF3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cyril, All,

On 2015-12-22 09:18 +1100, Cyril Bur spake thusly:
> On Mon, 21 Dec 2015 10:25:13 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > But then, the 'original' binaries are still present in the build
> > directory, where they are definitely not stripped (at least, not by
> > Builroot). Isn't that enough?
> Doh, you're right of course they'll be in the linux build dir, I'll change that
> too - I'll be sure to comment that one, even I totally forgot that haha.

If you were planning on adding a comment like "if you need to objdump
the binaries, they are still present unstripped in the build directory"
then you should not: it's the case for all and every packages; there's
nothing special about this for the kselftests.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
