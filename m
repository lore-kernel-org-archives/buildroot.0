From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Mar 2016 06:22:02 +0200
Subject: [Buildroot] [PATCH 2/2] docs: fix syntax error in
 makedev-syntax example. In the makedev syntax documentation,
 one of the examples lacks the "mode" value.
In-Reply-To: <20160308202039.GB3856@free.fr>
References: <1457294608-2129-1-git-send-email-alan@tkos.co.il>
 <1457294608-2129-2-git-send-email-alan@tkos.co.il>
 <20160308202039.GB3856@free.fr>
Message-ID: <20160309042202.GA2877@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Mar 08, 2016 at 09:20:40PM +0100, Yann E. MORIN wrote:
> On 2016-03-06 22:03 +0200, Alan Yaniger spake thusly:
> > Signed-off-by: Alan Yaniger <alan@tkos.co.il>
> 
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This patch is marked 'Superseded' in patchwork already. The updated patch is 
at http://patchwork.ozlabs.org/patch/592587/.

baruch

> >  docs/manual/makedev-syntax.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
> > index 0bbc16e..e4dffc9 100644
> > --- a/docs/manual/makedev-syntax.txt
> > +++ b/docs/manual/makedev-syntax.txt
> > @@ -44,7 +44,7 @@ this syntax, you will need to write:
> >  ----
> >  /usr/bin/foo f 755 0 0 - - - - -
> >  /usr/bin/bar f 755 root root - - - - -
> > -/data/buz f buz-user buz-group - - - - -
> > +/data/buz f 644 buz-user buz-group - - - - -
> >  ----
> >  
> >  Alternatively, if you want to change owner/permission of a directory

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
