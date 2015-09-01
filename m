From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Sep 2015 14:30:23 +0300
Subject: [Buildroot] [PATCH 1/2] dos2unix: add target support
In-Reply-To: <55E58486.2000407@imgtec.com>
References: <d04d05bf5fb09fd02747689fe348375cdff4fc6a.1441089817.git.baruch@tkos.co.il>
 <55E58486.2000407@imgtec.com>
Message-ID: <20150901113023.GO17874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicent,

On Tue, Sep 01, 2015 at 11:57:10AM +0100, Vicente Olivert Riera wrote:
> On 09/01/2015 07:43 AM, Baruch Siach wrote:
> > From: James Knight <james.knight@rockwellcollins.com>
> > 
> > Allow the `dos2unix` utility to be built and installed on the target
> > system.
> > 
> > [baruch: properly handle target gettext]
> > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > v2:
> >    * Fix static build with gettext
> >    * Support build without locale support
> > ---
> 
> I guess Baruch forgot to add v2 the subject line and James forgot to
> mark its previous patch as superseded in Patchwork.

You are correct on the former, my fault. As for the latter I guess James has 
not seen the v2 patch yet, given the timezone difference.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
