From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 29 Nov 2011 14:06:08 +0000
Subject: [Buildroot] [PATCH] Bump version of htop to 1.0.
In-Reply-To: <87mxbiirbx.fsf@macbook.be.48ers.dk>
References: <F9C551623D2CBB4C9488801D14F864C60DA8AE@ex-mb1.corp.adtran.com>
 <87mxbiirbx.fsf@macbook.be.48ers.dk>
Message-ID: <F9C551623D2CBB4C9488801D14F864C60DBB62@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  ANDY> -$(eval $(call AUTOTARGETS))
>  ANDY> +$(eval $(call AUTOTARGETS,package,htop))
> 
> Don't change this. The package dir / name arguments are no longer
> needed.
> 
> Other than that it looks fine, committed to next - Thanks.
> 
> --
> Bye, Peter Korsgaard


Ah,  I wondered about this.  I'm building the patches off of
a very old tree.  I saw that but didn't think anything about it.

I'll try to keep this in mind (and update to the latest BuildRoot).

Do I need to change and resubmit, or did you just fix it for
me?

Thanks,
Andy
