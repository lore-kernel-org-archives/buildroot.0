From: daggs <daggs@gmx.com>
Date: Fri, 7 Oct 2016 12:04:40 +0200
Subject: [Buildroot] [PATCH] odroidc2: bump kernel rev to
 925e508d37c76848881a8c8f7e9b02abc5731d88
In-Reply-To: <87mviglcoe.fsf@dell.be.48ers.dk>
References: <20161007074951.25748-1-daggs@gmx.com>,
 <87mviglcoe.fsf@dell.be.48ers.dk>
Message-ID: <trinity-e30c4e18-6cd0-464f-971e-5bd960759cf6-1475834680131@3capp-mailcom-bs10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Sent: Friday, October 07, 2016 at 12:40 PM
> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [PATCH] odroidc2: bump kernel rev to 925e508d37c76848881a8c8f7e9b02abc5731d88
>
> >>>>> "Dagg" == Dagg Stompler <daggs@gmx.com> writes:
> 
>  > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> 
> Why? Does it fix any problems or add any new features?
> 
> A bit more detailed description would be good.
> 
> > ---
>  >  configs/odroidc2_defconfig | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>  > diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
>  > index 0c8ff3d..44fc61a 100644
>  > --- a/configs/odroidc2_defconfig
>  > +++ b/configs/odroidc2_defconfig
>  > @@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
>  >  BR2_LINUX_KERNEL=y
>  >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  >  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
>  > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1cb48cebb9d525e524de0ede46710bb29f54d4a6"
>  > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="925e508d37c76848881a8c8f7e9b02abc5731d88"
>  >  BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
>  >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  >  BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
>  > -- 
>  > 2.10.1
> 
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> -- 
> Bye, Peter Korsgaard
> 
you are correct, will resend with more info
