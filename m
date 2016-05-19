From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 May 2016 14:12:01 +0300
Subject: [Buildroot] [PATCH v3 next] openblas: new package
In-Reply-To: <573D9BBE.8060408@imgtec.com>
References: <1463652602-3276-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160519101735.GX2178@tarshish> <573D9BBE.8060408@imgtec.com>
Message-ID: <20160519111201.GZ2178@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Thu, May 19, 2016 at 11:55:58AM +0100, Vicente Olivert Riera wrote:
> On 19/05/16 11:17, Baruch Siach wrote:
> > On Thu, May 19, 2016 at 11:10:02AM +0100, Vicente Olivert Riera wrote:
> >> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> >> ---
> >> Changes v2 -> v3:
> >>  - Switch version to HEAD of develop branch as it contains support for
> >>    MIPS32.
> >>  - Add a patch to fix build failure of P5600 and I6400 targets.
> > 
> > Where is this patch?
> 
> referenced in the openblas.mk file, in OPENBLAS_PATCH variable:
> 
> OPENBLAS_PATCH =
> https://github.com/vriera/OpenBLAS/commit/e12cff87b86615f5a4643d246a6c1963a0e81ca5.patch

Right, I missed that. Please add a link to your pull request 
(https://github.com/xianyi/OpenBLAS/pull/886) in a comment.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
