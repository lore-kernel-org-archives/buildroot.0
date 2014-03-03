From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Mar 2014 18:19:38 +0100
Subject: [Buildroot] [PATCH 0/19 v3] Add new virtual-package
	infrastructure
In-Reply-To: <cover.1393778339.git.yann.morin.1998@free.fr>
References: <cover.1393778339.git.yann.morin.1998@free.fr>
Message-ID: <20140303171938.GA3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

On 2014-03-02 17:52 +0100, Yann E. MORIN spake thusly:
> Here is a quick series implementing a new infrastructure for virtual
> packages.
[--SNIP--]
> So the series:
[--SNIP--]
>   - and finally converts the virtual packages over to the new infra.

Doh... It just occured to me I forgot to convert the package that spawn
all this virtual-package stuff in the first place: udev.

It will be present in the next spin of the series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
