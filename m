From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 20:16:55 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided bysystemd
 or eudev.
In-Reply-To: <F5FDAC8BFE2A485C97C01535BDAA2ECA@JohanW7>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20130917071737.4af20d60@skate> <20130917125352.GB13723@pc-eric>
 <20130917204539.7c788c2b@skate> <52394FAB.30109@mind.be>
 <20130918175838.32d9763a@skate> <5239CF75.2050807@mind.be>
 <20130918184118.3794c883@skate>
 <60DD971516BF4BC19E62266390C4237A@JohanW7>
 <F5FDAC8BFE2A485C97C01535BDAA2ECA@JohanW7>
Message-ID: <20130918201655.51a4291a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed, 18 Sep 2013 20:05:29 +0200, Sagaert Johan wrote:

> I have a patch here to remove the inline execvpe function,
> I did not dive deep into it but I suppose this inline was needed for older versions of uClibc.
> My build with uClibc 0.9.33.2 finished without the inline execvpe.
> 
> How can a patch be applied if, and only if uClibc 0.9.33.2 is selected ?
> In other words is there some infrastructure in buildroot to apply patches based on a specified condition ?

I believe that Eric's patches take care of that, by adding an
AC_CHECK_FUNCS on execvpe. See
http://patchwork.ozlabs.org/patch/273211/.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
