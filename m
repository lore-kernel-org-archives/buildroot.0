From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Dec 2012 23:06:20 +0100
Subject: [Buildroot] [PATCH 20/51] package/libbsd: new package
In-Reply-To: <20121209194627.04720a09@skate>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <1355070924-8009-21-git-send-email-yann.morin.1998@free.fr>
 <20121209194627.04720a09@skate>
Message-ID: <201212092306.20942.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 09 December 2012 Thomas Petazzoni wrote:
> On Sun,  9 Dec 2012 17:34:53 +0100, Yann E. MORIN wrote:
> 
> > +LIBBSD_AUTORECONF      = YES
> > +LIBBSD_AUTORECONF_OPT  = -f -i
> 
> Justification for AUTORECONF?

Hmmm... I remember that I needed to explicitly specify the autoreconf
flags, or the standard autoreconf would not work. However, I don't
remember why autoreconf was needed in the first place...

I removed it, and it still builds OK.

I'll redo a complete build of the stack with this change, to see if it
has impacts further down along the line...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
