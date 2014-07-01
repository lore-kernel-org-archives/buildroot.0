From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 22:16:15 +0200
Subject: [Buildroot] Is grub-bios-setup the way to go to make a bootable
 CF?
In-Reply-To: <7556076.bIs51ja7gL@sagittea>
References: <CAEzGmjD9xC59mSjgPAr2GeB15cUwaExp7KfjbRyRMFVHD=92+g@mail.gmail.com>
 <1430516.W2oeO2VcYf@sagittea>
 <CAEzGmjCaiBrTF6ze16xta95-9n19Yd6HzRsR-W_pTKTppej0Dg@mail.gmail.com>
 <7556076.bIs51ja7gL@sagittea>
Message-ID: <20140701221615.6c6b53cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, Lennart,

On Tue, 01 Jul 2014 21:56:19 +0200, J?r?me Pouiller wrote:

> > Thanks for your quick reactions to my complaint.
> > I regret to say though, that I can't test any patch until I have found a
> > 'Patching for .. eh.. dummies', or similar.
> > I.e. I have not yet learned how to apply a patch :-(
> If you use git, save mail containing patch as a file and use 
> 
>   git am PATH_TO_SAVED_MAIL_CONTAINING_PATCH

Or, to apply directly J?r?me's patch from the Buildroot patchwork:

 cd buildroot/
 curl http://patchwork.ozlabs.org/patch/366158/mbox/ | git am

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
