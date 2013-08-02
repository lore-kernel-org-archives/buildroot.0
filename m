From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Aug 2013 18:55:33 +0200
Subject: [Buildroot] [PATCH RFC] host-mkpasswd: new package
In-Reply-To: <006319514f28056ea03a.1375440500@BEANTN0L019720>
References: <006319514f28056ea03a.1375440500@BEANTN0L019720>
Message-ID: <20130802165533.GB3349@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-08-02 12:48 +0200, Thomas De Schampheleire spake thusly:
> Since the addition of root password setting support in buildroot, there have
> been a few bug reports in this area ([1], [2]). In these cases, the system
> mkpasswd did either not work, or did not provide the options we expect, like
> -m <method>.
> 
> This patch adds a mkpasswd host package, based on the sources from whois. When
> a non-empty root password is set, this package is used as a dependency.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Untested, but looks OK (which is all a reviewed-by means, by all means).

Since it's too late for -rc1 I believe, I'll test it this WE.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
