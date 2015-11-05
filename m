From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Thu, 5 Nov 2015 08:46:29 +0000
Subject: [Buildroot] [PATCH v7] board: add support for Intel Galileo Gen
 2
In-Reply-To: <20151104215357.4a051888@free-electrons.com>
References: <1445359684.18938.6.camel@intel.com>
 <20151104215357.4a051888@free-electrons.com>
Message-ID: <1446713189.3133.1.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Yes - I saw the comments they where much appreciated. 
Patch addressing comments expected early next week!

Thanks,

Ray K

On Wed, 2015-11-04 at 21:53 +0100, Thomas Petazzoni wrote:
> Dear Kinsella, Ray,
> 
> On Tue, 20 Oct 2015 16:48:04 +0000, Kinsella, Ray wrote:
> > Delta's from v6:-
> >  * Changed spaces for tabs in efi-part, genimage, grub & S09modload 
> > 
> > Board support package includes:-
> >  * Toplevel build root configuration
> >  * Github based 3.8.7 Kernel
> >   * Upstream 3.8.7
> >   * Linux 3.8.7 Kernel Driver Patches
> >  * Linux 3.8.7 configuration
> >  * Grub configuration
> >  * Init Script to load modules
> >  * genimage config to create sdcard image. 
> > 
> > Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> 
> Arnout did a review of this patch, and made a number of comments. Could
> you address them and post an updated version?
> 
> In the mean time, I'll mark your patch as Changes Requested in
> patchwork.
> 
> Thanks a lot!
> 
> Thomas
