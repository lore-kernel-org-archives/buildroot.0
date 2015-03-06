From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 6 Mar 2015 06:24:26 +0200
Subject: [Buildroot] [PATCH] lmbench: fix build with libtirpc
In-Reply-To: <CAHkwnC8Zeo-WnPNWyCMdGgQJJVenJeG_iOw49G7qY-HkEg_G1A@mail.gmail.com>
References: <f0fb27c9ad91fe83813103a3d6035930fb63636e.1424766423.git.baruch@tkos.co.il>
 <CAHkwnC8Zeo-WnPNWyCMdGgQJJVenJeG_iOw49G7qY-HkEg_G1A@mail.gmail.com>
Message-ID: <20150306042426.GA15668@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Thu, Mar 05, 2015 at 07:03:51PM +0100, Fabio Porcedda wrote:
> On Tue, Feb 24, 2015 at 9:27 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > When linking with an external libtirpc, -ltirpc must come after lmbench.a in
> > the linker command line. Use LDLIBS for that.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/89e/89ee35561d3a49f38e9a747ed78a5846be4764c8/
> > http://autobuild.buildroot.net/results/409/4097b1c2585db2de517a8741174c02177aabee00/
> >
> > and more.
> 
> This patch doesn't apply anymore.
> 
> Could you rebase it?

Just sent an updated version.

Thanks for noticing,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
