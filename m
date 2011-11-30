From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 30 Nov 2011 10:49:03 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <000d01ccaf7e$78243280$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111130173327.069f46fb@skate>
 <000d01ccaf7e$78243280$0400a8c0@dspcgrnzks9p98>
Message-ID: <201111301049.05620.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed November 30 2011, Jeff Krasky wrote:
> > Those are not Buildroot variables, but Kbuild variables, that you must
> > pass when running the modules_install. The fact that EtherCAT contains
> > kernel modules makes it not completely straightforward to package.
> 
> At what point is modules_install being run?
> 
> > Do you need it right now ? I might be interested in helping package
> > EtherCAT, but I don't have much time at the moment.
> 
> Time is very short, yes.  Anything you can do to help is definitely
> appreciated.  Like, for now, can you say more about running modules_install
> and passing parameters to it?
>

Would a worked example help?
This package patches the kernel and builds the related software:
http://git.buildroot.net/buildroot/commit/?id=956d4ab0f501c44f977297d8faac95afa43f3082

Mike 
> Thank you very much, again.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
