From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 15 Aug 2017 07:14:34 +0300
Subject: [Buildroot] [PATCH 2/3] whois: use github repo as home page
In-Reply-To: <20170814220354.3665d3eb@windsurf>
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
 <fa924d0754ef385b1706721751e5f6f00e60c199.1502649259.git.baruch@tkos.co.il>
 <20170814220354.3665d3eb@windsurf>
Message-ID: <20170815041434.tlygmw6w4skyih6k@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Aug 14, 2017 at 10:03:54PM +0200, Thomas Petazzoni wrote:
> On Sun, 13 Aug 2017 21:34:18 +0300, Baruch Siach wrote:
> > The github repo is more informative than the list Marco's software on
> > the previous link.
> > 
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> What about switching the upstream to be Github, instead of fetching
> from Debian? The Github repo has all the releases available:
> https://github.com/rfc1036/whois/releases.
> 
> Just make sure that the 5.2.14 tarball we were getting from Debian is
> similar in contents to what we get from the Github repository for the
> same version.

But we generally prefer upstream provided tarballs, aren't we? Moreover, in 
this case the Debian repo provides a smaller .tar.xz, and an upstream computed 
SHA256 in the .dsc file. You don't get that from github.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
