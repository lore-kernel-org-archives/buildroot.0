From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Oct 2014 21:38:17 +0200
Subject: [Buildroot] [PATCH] ipset: Don't include host headers
In-Reply-To: <20141028185725.53f96e89@free-electrons.com>
References: <c69b0ea4caf640e9ca3c2357f6e701cab02fa689.1414449206.git.baruch@tkos.co.il>
 <20141028185725.53f96e89@free-electrons.com>
Message-ID: <20141028193817.GB1759@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Oct 28, 2014 at 06:57:25PM +0100, Thomas Petazzoni wrote:
> On Tue, 28 Oct 2014 00:33:26 +0200, Baruch Siach wrote:
> > Add a patch removing /usr/local/include from the include path.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/4f5/4f55c2415281c6204500efe28fe9e24c8ef73863/
> > 
> > Technically speaking this autobuild failure has already been fixes when
> > -Werror was removed in commit a923b44112aa3 (ipset: add patch to fix
> > --enable-debug build). But the warning in this case indicates a real problem
> > that needs to be fixed by itself.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  ...Make_global.am-Don-t-include-host-headers.patch | 29 ++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 package/ipset/0002-Make_global.am-Don-t-include-host-headers.patch
> 
> Thanks, applied. Can you please submit the patch upstream?

Done (http://marc.info/?l=netfilter-devel&m=141452470614763&w=2).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
