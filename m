From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Jan 2017 16:49:25 +0200
Subject: [Buildroot] [V2 1/1] sngrep: new package
In-Reply-To: <1485355607.2005.13.camel@codeblue.com>
References: <20170125140904.26849-1-aduskett@codeblue.com>
 <20170125144403.bfj52rm3mmdjtd7n@tarshish>
 <1485355607.2005.13.camel@codeblue.com>
Message-ID: <20170125144925.cegeiwvbvac2yvnb@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Wed, Jan 25, 2017 at 02:46:47PM +0000, Adam Duskett wrote:
> On Wed, 2017-01-25 at 16:44 +0200, Baruch Siach wrote:
> > On Wed, Jan 25, 2017 at 09:09:04AM -0500, Adam Duskett wrote:
> > > +config BR2_PACKAGE_SNGREP
> > > +	bool "sngrep"
> > > +	select BR2_PACKAGE_NCURSES_WCHAR
> > > +	select BR2_PACKAGE_NCURSES_TARGET_PANEL
> > > +	select BR2_PACKAGE_NCURSES_TARGET_FORM
> > > +	select BR2_PACKAGE_NCURSES_TARGET_MENU
> > > +	depends on BR2_PACKAGE_LIBPCAP
> > > +	depends on BR2_PACKAGE_NCURSES
> > 
> > These should be select.
> Could I ask a question?
> When should I use depends on and when should I use select?
> I am not sure what the rules are on this.

See section 17.2.3 (Choosing depends on or select) in the manual[1].

[1] http://nightly.buildroot.org/manual.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
