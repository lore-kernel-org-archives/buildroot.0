From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jan 2013 21:02:31 +0100
Subject: [Buildroot] [PATCH] package/dvb-apps: add option to install
	utilities
In-Reply-To: <20130105190023.5ed0c97d@skate>
References: <1357398022-29518-1-git-send-email-yann.morin.1998@free.fr>
 <20130105190023.5ed0c97d@skate>
Message-ID: <201301052102.31915.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Saturday 05 January 2013 Thomas Petazzoni wrote:
> On Sat,  5 Jan 2013 16:00:22 +0100, Yann E. MORIN wrote:
> > +DVB_APPS_INSTALL_STAGING = YES
> 
> Why ?

It installs libraries and headers.
And I forgot to add the DVB_APPS_INSTALL_STAGING_CMDS (I wrongly assumed
it sould default to _INSTALL_TARGET_CMDS).

I will re-spin after a re-test.

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
