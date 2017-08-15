From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 15 Aug 2017 14:20:18 +0300
Subject: [Buildroot] [PATCH 2/3] whois: use github repo as home page
In-Reply-To: <20170815125621.4d78c480@windsurf>
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
 <fa924d0754ef385b1706721751e5f6f00e60c199.1502649259.git.baruch@tkos.co.il>
 <20170814220354.3665d3eb@windsurf>
 <20170815041434.tlygmw6w4skyih6k@sapphire.tkos.co.il>
 <b6dfe8f7-5fa2-1ade-2aa5-eaeab13b271c@mind.be>
 <20170815125621.4d78c480@windsurf>
Message-ID: <20170815112018.rg7udjb7zlfps4ue@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Aug 15, 2017 at 12:56:21PM +0200, Thomas Petazzoni wrote:
> On Tue, 15 Aug 2017 12:10:17 +0200, Arnout Vandecappelle wrote:
> 
> > > But we generally prefer upstream provided tarballs, aren't we? Moreover, in 
> > > this case the Debian repo provides a smaller .tar.xz, and an upstream computed 
> > > SHA256 in the .dsc file. You don't get that from github.  
> > 
> >  On Sunday, I was going to ask the same question, and came to the same
> > conclusion about the tar.xz and the sha256. Unfortunately, I don't remember why
> > I didn't just apply it then and there...
> 
> I definitely don't agree here. We should use upstream when it exists,
> even if it provides things that are less "convenient" than Debian.
> 
> Otherwise, we're going to convert a *lot* of packages to use tarballs
> from Debian rather than from upstream.
> 
> What will happen when we'll want to bump to a new upstream version that
> hasn't been packaged by Debian ?

As things stand now this is quite unlikely. The whois package Debian 
maintainer and the upstream developer are the same person, Marco d'Itri. The 
only upstream in-tree changelog file is at debian/changelog.

> Sorry, but I definitely disagree here. Please use the real upstream.

The real whois upstream README file says this:

  The canonical distribution point for releases of the program is
  http://ftp.debian.org/debian/pool/main/w/whois/ .

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
