From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 12 Jul 2007 17:51:47 +0200
Subject: [Buildroot]
	=?iso-8859-1?q?svn_commit=3A_trunk/buildroot=3A_packa?=
	=?iso-8859-1?q?ge=09package/busybox_project_target/_etc=2E=2E=2E?=
In-Reply-To: <1184248611.5175.31.camel@elrond.sweden.atmel.com>
References: <20070712131106.1E690A4757@busybox.net>
	<20070712144244.GB21387@aon.at>
	<1184248611.5175.31.camel@elrond.sweden.atmel.com>
Message-ID: <200707121751.47836.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf, Bernhard,
All,

On Thursday 12 July 2007 15:56, Ulf Samuelsson wrote:
> tor 2007-07-12 klockan 16:42 +0200 skrev Bernhard Fischer:
> > On Thu, Jul 12, 2007 at 06:11:06AM -0700, ulf at uclibc.org wrote:
> > >+PROJECT:=$(strip $(subst ",, $(BR2_PROJECT)))
> > >+HOSTNAME:=$(strip $(subst ",, $(BR2_HOSTNAME)))
> > >+BANNER:=$(strip $(subst ",, $(BR2_BANNER)))
> > This breaks vi's syntax highlighing, please fix
> Pls supply a template on what you want me to do.

I guess something like the following:

PROJECT:=$(strip $(subst ",, $(BR2_PROJECT)))
# Shut up you stupid vim! "
HOSTNAME:=$(strip $(subst ",, $(BR2_HOSTNAME)))
# Shut up you stupid vim! "

And so on... Maybe comments at the end of the line would do as well...

Regards,
Yann E. MORIN.

PS. Using vi exclusively here, but no syntax highlighting, which I find
    ultimately annoying. Thank you, I know (or tend to) what I'm doing! :-)
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
