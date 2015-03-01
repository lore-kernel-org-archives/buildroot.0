From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 1 Mar 2015 20:15:55 +0100
Subject: [Buildroot] [PATCH v2 1/7] directfb: bump version to 1.7.7 and
 add hash
Message-ID: <trinity-1742d787-d422-4294-95ae-83889bfe4ab0-1425237355742@3capp-gmx-bs62>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, Feb 28, 2015 at 07:00:21PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 28 Feb 2015 11:37:10 +0100, Thomas Petazzoni wrote:
> 
> > I already had a series to bump DirectFB, but I never finished testing
> > it, so I never submitted it. I think my series has some more cleanups
> > than your series. Do you mind if I push my series somewhere so you can
> > have a look, and maybe pick up some additional things?
> 

Yes, for sure, you spotted a lot more cleanups and issues...

> I've pushed my patch series at:
> 
>   http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=directfb-bump
> 
> The list of commits is (in reverse order) :
> 
> directfb-examples: bump to 1.7.0, add hash file
> directfb-examples: do not install to staging
> directfb-examples: remove options for each example
> linux-fusion: use a more traditional style to define LINUX_FUSION_MAKE_OPTS
> linux-fusion: bump to 9.0.3, use .tar.xz and add hash file
> sawman: remove package
> divine: remove package
> directfb: add options for divine and sawman
> directfb: remove BR2_PACKAGE_DIRECTFB_DEBUG option
> directfb: remove BR2_PACKAGE_DIRECTFB_UNIQUE option
> directfb: remove broken X.org support
> directfb: add hash file
> directfb: bump to 1.7.6
> directfb: rename patches to the new naming convention
> 
> How shall we proceed to merge both of our series together? Are you
> willing to take care of this?
>

Will try to provide an updated patch version (my versions plus yours)
and do more testing...

Regards,
Peter

 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
