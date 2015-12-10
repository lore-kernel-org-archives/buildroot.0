From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Dec 2015 21:18:54 +0100
Subject: [Buildroot] Can I built from two sources in one package?
In-Reply-To: <5669D552.6020704@gmx.de>
References: <5669D552.6020704@gmx.de>
Message-ID: <20151210201854.GD3597@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2015-12-10 20:41 +0100, Andreas Ehmanns spake thusly:
> actually buildroot supports RADIUS with a client package but not a server
> package. I want to add the server but I'm not sure if I can add this to the
> existing client package or if I should create a complete new package.
> Client and Server are available in different tar.gz files from the official
> RADIUS site so I think it is better to have different packages for client
> and server. Am I wrong?

If they are indeed two different source tarballs, then make them two
different packages in Buildrot, indeed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
