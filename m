From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2013 18:53:29 +0100
Subject: [Buildroot] [PATCH v3] package/tvheadend: unbreak
In-Reply-To: <52A09866.9080800@mind.be>
References: <1386115721-24113-1-git-send-email-yann.morin.1998@free.fr>
 <52A09866.9080800@mind.be>
Message-ID: <20131205175329.GB3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-12-05 16:14 +0100, Arnout Vandecappelle spake thusly:
> On 04/12/13 01:08, Yann E. MORIN wrote:
> >+	 --cc="$(TARGET_CC)"			\
> >+	 --cflags="$(TARGET_CFLAGS)"		\
> 
>  It looks like the configure script is broken and fails if these variables
> contain spaces (like e.g. when ccache is used).

Doh... :-(

[--SNIP--]
>  Two options:
> - fix the scripts;
> - don't use --cc and --cflags but just pass them in the environment
> (assuming that this works).

I'll look what can be done with this. Thanks for the report.

Regards,
Yann e. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
