From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Feb 2017 22:52:55 +0200
Subject: [Buildroot] [PATCH 7/7] ddrescue: fix target build
In-Reply-To: <20170209214044.6aacb66e@free-electrons.com>
References: <a74544c971456bb628345f38c83de4148a6ca1e9.1486669818.git.baruch@tkos.co.il>
 <99cad486180867002ec348364cf9ac9028b74d0e.1486669818.git.baruch@tkos.co.il>
 <20170209214044.6aacb66e@free-electrons.com>
Message-ID: <20170209205255.oqgsll6bsfvfqt7i@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Feb 09, 2017 at 09:40:44PM +0100, Thomas Petazzoni wrote:
> On Thu,  9 Feb 2017 21:50:18 +0200, Baruch Siach wrote:
> > ddrescue is not an autotools package. Covert to generic package to make it
> > build correctly for target architecture.
> > 
> > Cc: Peter Seiderer <ps.report@gmx.net>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/ddrescue/ddrescue.mk | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> It's really weird to have this mixed with a patch series related to
> improving lzip support. I know ddrescue is using lzip, but this patch
> is really unrelated from lzip support. It would be better to send such
> patches separately.

I found the problem when testing ddrescue build, and the patch context depends 
on the previous patch. So I thought it might be better to keep the path in 
this series to indicate the dependency.

But you are right. I should have posted this patch separately.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
