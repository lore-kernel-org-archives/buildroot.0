From: Nasser <afshin.nasser@gmail.com>
Date: Thu, 25 Oct 2018 02:30:11 +0330
Subject: [Buildroot] [PATCH] merge_config.sh: Fix finding redundant
 config mechanism
In-Reply-To: <20181024191538.GA943@x230>
References: <1539989903-19803-1-git-send-email-Afshin.Nasser@gmail.com>
 <CANQCQpaxMvn2OEfP0aztbFRk0KTOTnt8nugZ-gwKL7oML1eQUw@mail.gmail.com>
 <7189ed78-6481-0290-f13b-88e3c1008937@mind.be>
 <20181023151902.GA18148@smart-All-Series>
 <13fac09f-009d-4bbf-1cce-d7d3cd2fd2d6@mind.be>
 <20181024191538.GA943@x230>
Message-ID: <20181024230011.GA7816@smart-ThinkPad-T410>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr
On Wed, Oct 24, 2018 at 09:15:39PM +0200, Petr Vorel wrote:
> Hi Arnout, Nasser,
> 
> > > Should I resend the patch applying Angelo -b approach?
> >  Yes, please do. Make sure you keep Angelo's authorship and add your Sob.
> Nice. So I'm not going to implement it (asked by Arnout).
> If you CC me, I'll review your patch.
> 
Sure, I'm preparing the patch. I'll send it here when it's ready. I
appreciate your review and help.
> > And please fix the remaining two comments I made:
> 
> > - remove the hunk that replaces alldefconfig with olddefconfig;
> 
> > - a patch should be added to support/kconfig/patches.
> 
> 
> >  As it happens, I talked today with the guy who submitted the merge_config.sh
> > script to the kernel (apparently this script comes from yocto, originally). He
> > thinks it would be a good idea to upstream this -b option to the kernel. I
> > didn't find the kconfig maintainer (Masahiro) though, but it's worth a try.
> I was planning to send a patch to linux-kbuild as well (after we complete this
> patch) as I also think it's something which upstream could take, so projects
> didn't have to carry patch for it. But feel free to implement send it there.
> 
OK.
> >  Regards,
> >  Arnout
> 
> Kind regards,
> Petr
Kind regards,
Nasser
