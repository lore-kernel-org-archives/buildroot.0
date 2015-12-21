From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 21:50:08 +0100
Subject: [Buildroot] [PATCH 3/8 RFC] core/pkg-generic: install
 foo-config scripts in their own dir
In-Reply-To: <20151221185150.GC1548@tarshish>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
 <66985474d41d8d25b6f75560665322b88f6e6813.1450712392.git.yann.morin.1998@free.fr>
 <20151221185150.GC1548@tarshish>
Message-ID: <20151221205008.GE3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-12-21 20:51 +0200, Baruch Siach spake thusly:
> On Mon, Dec 21, 2015 at 04:56:54PM +0100, Yann E. MORIN wrote:
> > +# foo-config scripts for the target go here
> > +FOO_CONFIG_DIR := $(HOST_DIR)/opt/foo-config
> 
> That's an unusual name for "real" identifiers and directories. But maybe it's 
> just me. How about LIB_CONFIG_SCRIPT_DIR instead?

Oh, well, 'foo-config' just has stuck, and I tried to keep it short.
Since it is used only in a very few locations, LIB_CONFIG_SCRIPT_DIR is
pretty OK, so I don't minf renaming.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
