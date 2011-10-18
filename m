From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 18 Oct 2011 18:02:46 +0200
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <201110181055.22743.minimod@morethan.org>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <20111018163202.504d5069@skate> <201110181055.22743.minimod@morethan.org>
Message-ID: <201110181802.46594.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, All,

On Tuesday 18 October 2011 17:55:20 Michael S. Zick wrote:
> On Tue October 18 2011, Thomas Petazzoni wrote:
> > Le Tue, 18 Oct 2011 11:14:54 -0300,
> > Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
> > 
> > > +	if test -n "$(3)" ; then \
> > > +		case "$($(PKG)_SITE_METHOD)" in \
> > > +			git) exit ;; \
> > > +			svn) exit ;; \
> > > +			bzr) exit ;; \
> > > +			file) exit ;; \
> > 
> 
> How about just a nop?
> s/exit/:/

Or simply:
  foo) ;;

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
