From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2013 18:35:51 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
In-Reply-To: <20130103113110.621c0e92@skate>
References: <cover.1357070939.git.yann.morin.1998@free.fr>
 <606d.50e4ee64.b8dde@xionine.xdna.net> <20130103113110.621c0e92@skate>
Message-ID: <201301031835.51403.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 03 January 2013 Thomas Petazzoni wrote:
> On Thu, 03 Jan 2013 02:35:16 -0000, Cam Hutchison wrote:
> > Another +1 for awk here - processing record-oriented files is what
> > awk is good at, but I can understand not wanting to introduce that
> > dependency.
> 
> We already depend on awk:
>   http://git.buildroot.net/buildroot/tree/support/dependencies/dependencies.sh#n133

OK, I'll update the script, then.

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
