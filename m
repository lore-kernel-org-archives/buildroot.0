From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 29 Oct 2018 11:30:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-10-28
In-Reply-To: <8c72bbcb-d38f-d5b5-d5a6-cc59e3173aad@armadeus.com>
References: <20181029070026.9C8E12099B@mail.bootlin.com>
 <8c72bbcb-d38f-d5b5-d5a6-cc59e3173aad@armadeus.com>
Message-ID: <20181029093020.2haow5p6w46k4fj3@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi S?bastien

On Mon, Oct 29, 2018 at 10:16:13AM +0100, S?bastien Szymanski wrote:
> On 10/29/2018 08:00 AM, Thomas Petazzoni wrote:
> > This is the list of Buildroot build failures that occured on
> > 2018-10-28, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> > 
> > Results for the 'master' branch
> > ===============================
> > 
> > Build failures related to your packages:
> > 
> >      aarch64 | mmc-utils-37c86e60c0442fef5... | http://autobuild.buildroot.net/results/233ef5c00951b5be10a59408f4a8781ecc658d74
> >      aarch64 | mmc-utils-37c86e60c0442fef5... | http://autobuild.buildroot.net/results/eba3cf4ac21095bca5af2d5d1d69aca0c9098f9b
> > 
> 
> A patch has been proposed to fix this:
> 
> https://patchwork.kernel.org/patch/10654531/
> 
> Should we copy it in BR or wait for it to be accepted by upstream?

No need to wait. It might take time for upstream to apply the patch. In the 
meant time we it would be nice to clean the autobuilder. Once upstream fixes 
the issue we can drop the patch with the version bump.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
