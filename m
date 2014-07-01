From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 01 Jul 2014 21:56:19 +0200
Subject: [Buildroot] Is grub-bios-setup the way to go to make a bootable
	CF?
In-Reply-To: <CAEzGmjCaiBrTF6ze16xta95-9n19Yd6HzRsR-W_pTKTppej0Dg@mail.gmail.com>
References: <CAEzGmjD9xC59mSjgPAr2GeB15cUwaExp7KfjbRyRMFVHD=92+g@mail.gmail.com>
 <1430516.W2oeO2VcYf@sagittea>
 <CAEzGmjCaiBrTF6ze16xta95-9n19Yd6HzRsR-W_pTKTppej0Dg@mail.gmail.com>
Message-ID: <7556076.bIs51ja7gL@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lennart,

On Tuesday 01 July 2014 21:32:08 Lennart Ramberg wrote:
> On Tue, Jul 1, 2014 at 10:49 AM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> > Hello Lennart,
> > ...
> > Can you try patch that follows this mail (called "grub2: Specify boot
> > partition")? Does it solve your issue?
> > 
> > Hi Thomas & J?r?me,
> 
> Thanks for your quick reactions to my complaint.
> I regret to say though, that I can't test any patch until I have found a
> 'Patching for .. eh.. dummies', or similar.
> I.e. I have not yet learned how to apply a patch :-(
If you use git, save mail containing patch as a file and use 

  git am PATH_TO_SAVED_MAIL_CONTAINING_PATCH


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
