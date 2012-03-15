From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 15 Mar 2012 09:33:53 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: use series file to apply
 patches in proper order
In-Reply-To: <20120314225134.35250051@skate>
References: <20120314120310.13e0ea3a@skate>
 <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
 <20120314225134.35250051@skate>
Message-ID: <20120315083353.GM2725@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 14, 2012 at 10:51:34PM +0100, Thomas Petazzoni wrote:
> Hello Ludovic,
> 
> Le Wed, 14 Mar 2012 16:33:51 +0100,
> ludovic.desroches at atmel.com a ?crit :
> 
> > Thank you Thomas.
> > 
> > Please find the previous set of patches plus the one about series file.
> 
> I did test your patches and found them working as expected. As you have
> probably seen, I have sent a mail to Peter to ask him to pull these
> patches quickly. I hope this will happen soon.

It's a good news. Thanks for testing it.

> 
> Would it be possible for you to write a little help text/documentation
> in a comment at the beginning of the apply-patches.sh script? The
> semantic of this script has become quite complicated, and some
> documentation has become necessary I think. 

Ok I will send a new patch for this.

> It would also be good to
> update the help text of the BR2_LINUX_KERNEL_PATCH option? Maybe we
> also need to change the U-Boot BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR so
> that it is capable of using a tarball of patches and not only a
> directory, and ditto for BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR and
> BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR.
> 
> Of course, all of those suggestions can be implemented later, and they
> are not an additional condition to the merge of the existing 6 patches.
> 
> Thanks for your work and persistence,

No problem, thanks for your help and thanks to Arnout for the first reviews
and acks.


Regards

Ludovic
