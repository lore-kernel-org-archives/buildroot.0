From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 14 Nov 2016 23:43:33 +0200
Subject: [Buildroot] [PATCH] openjpeg: security bump to version 2.1.2
In-Reply-To: <20161114223404.7c3b88be@free-electrons.com>
References: <08339f7ad87912d98912f4c52268b6c79ffd515c.1479156463.git.baruch@tkos.co.il>
 <20161114223404.7c3b88be@free-electrons.com>
Message-ID: <20161114214333.oaw6ounj642bkwou@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Nov 14, 2016 at 10:34:04PM +0100, Thomas Petazzoni wrote:
> On Mon, 14 Nov 2016 22:47:43 +0200, Baruch Siach wrote:
> > See CHANGELOG.md for the full list of fixes, including security issues.
> > 
> > See CVE number lists at [1] and [2].
> > 
> > [1] http://advisories.mageia.org/MGASA-2016-0362.html
> > [2] https://lists.fedoraproject.org/archives/list/package-announce at lists.fedoraproject.org/thread/HPMDEUIMHTLKMHELDL4F4HZ7X4Y34JEB/
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/openjpeg/openjpeg.hash | 2 +-
> >  package/openjpeg/openjpeg.mk   | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> Applied to master, thanks.

I mistakenly created this patch against -next. The newly added patches in 
master don't apply to this version. I'll post a fix.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
