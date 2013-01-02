From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Jan 2013 19:05:38 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
In-Reply-To: <54d5.50e3ad18.76e0@xionine.xdna.net>
References: <cover.1357070939.git.yann.morin.1998@free.fr>
 <0b0fa3ae335483e6402e2c15465cacdb2d51b0d7.1357070939.git.yann.morin.1998@free.fr>
 <54d5.50e3ad18.76e0@xionine.xdna.net>
Message-ID: <201301021905.39396.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam, All,

On Wednesday 02 January 2013 Cam Hutchison wrote:
> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
> 
> >+The syntax for adding a user is a space-separated list of fields, one
> >+user per-line; the fields are:
> 
> per line - no hyphen here.
> 
> >+* no field may contain a column (+:+).
> 
> Found it - this is the third spelling mistake I referred to earlier.
> s/column/colon/

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
