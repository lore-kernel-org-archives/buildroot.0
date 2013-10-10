From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Oct 2013 19:20:14 +0200
Subject: [Buildroot] [PATCH 3/9] package/wayland: install
 wayland-scanner to $(HOST)
In-Reply-To: <20131010090530.169e7a88@skate>
References: <cover.1381354867.git.yann.morin.1998@free.fr>
 <448f7432fc0b7c091413dd494e6b9d838cf51527.1381354867.git.yann.morin.1998@free.fr>
 <20131010090530.169e7a88@skate>
Message-ID: <20131010172014.GA3230@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-10-10 09:05 +0200, Thomas Petazzoni spake thusly:
> On Wed,  9 Oct 2013 23:44:19 +0200, Yann E. MORIN wrote:
> > +	 install -m 0755 -D wayland-scanner $(HOST_DIR)/usr/bin/wayland-scanner )
> 
> 	$(INSTALL)
> 
> Also, that's nitpicking, but we generally don't have a space between
> the end of the command and the closing parenthesis.

OK, will fix both. Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
