From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 8 Jun 2014 18:44:20 +0300
Subject: [Buildroot] FW: [PATCH 1/1] toolchain-buildroot: create
	a	relocatable one
In-Reply-To: <884EA965490E3C4D8E66AEF41E9802502528F6@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E9802502525C8@ezex10.ezchip.com>
 <20140608145430.0125bb29@free-electrons.com>
 <884EA965490E3C4D8E66AEF41E980250252659@ezex10.ezchip.com>
 <20140608154632.1f6f13a6@free-electrons.com>
 <884EA965490E3C4D8E66AEF41E9802502528F6@ezex10.ezchip.com>
Message-ID: <20140608154420.GF4074@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Noam,

On Sun, Jun 08, 2014 at 03:27:38PM +0000, Noam Camus wrote:
> > If your company IT department is unable to understand which tools the
> > company engineers need to properly contribute to open-source communities,
> > I'd say you should create a GMail account, and use that as the SMTP server
> > to send your e-mail. I believe that's what a lot of people do when they
> > have to work in hostile environments.
> 
> [Noam Camus] Do I need to subscribe again with my gmail account?
> Is adding to command line --smtp-server=smtp.gmail.com is enough?
> What about the user name in gmail?
> Any working example somewhere under doc?

See the EXAMPLE section of the git-send-email(1) man page (online at 
http://git-scm.com/docs/git-send-email).

You git username need not be the same as your gmail account. The former is 
defined under the [user] git configuration section with the 'name' and 'email' 
parameters. The latter is defined under the [sendemail] section as described 
in the manual page I referred to above.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
