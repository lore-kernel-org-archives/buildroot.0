From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jan 2013 15:27:13 +0100
Subject: [Buildroot] [PATCH 3/6] toolchain/crosstool-ng: sprinkle with
	some calls to MESSAGE
In-Reply-To: <50FBF77E.3040106@mind.be>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
 <f69a7b3d3f92b370d81f7f99e03771eebdb7c134.1358379198.git.yann.morin.1998@free.fr>
 <50FBF77E.3040106@mind.be>
Message-ID: <201301201527.13495.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Sunday 20 January 2013 Arnout Vandecappelle wrote:
> >   	    echo "CTNG_TUPLE='$${CTNG_TUPLE}'";                             \
> >   	    echo "CTNG_SYSROOT='$${CTNG_SYSROOT}'";                         \
> 
>   What are these two echoes doing there? git blame points to you, Yann...

They've been there from the beginning. IIRC, I used those during the
initial ct-ng backend integration, as a debug thingy.

I guess they can now be removed, of course.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
