From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Oct 2013 18:24:29 +0200
Subject: [Buildroot] [PATCH 9/9] manual: rework Deploying images chapter
In-Reply-To: <CAHXCMMKzwCJbHJG-zx_7r8LavH0sJT71e12zq3p_J+GFuf8fqQ@mail.gmail.com>
References: <cover.1381002281.git.s.martin49@gmail.com>
 <a2cb1b7caaa580f341abbb3788d18323c3e2e7c3.1381002281.git.s.martin49@gmail.com>
 <52546B18.7010207@mind.be>
 <CAHXCMMKzwCJbHJG-zx_7r8LavH0sJT71e12zq3p_J+GFuf8fqQ@mail.gmail.com>
Message-ID: <52600F3D.6020401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/10/13 10:40, Samuel Martin wrote:
> Arnout,
>
>
> 2013/10/8 Arnout Vandecappelle <arnout at mind.be <mailto:arnout@mind.be>>
>
>     On 10/05/13 21:49, Samuel Martin wrote:
>
>         [...]
>
>         +
>         +[WARNING]
>         +Be careful, *the _board's_ readme files coming within Buildroot are
>         +provided without warranty of any kind*.
>         +They are contributions from Buildroot users, but Buildroot
>         developers
>         +do not ensure their correctness, nor maintain them.
>
>
>       Is this warning really necessary? Most readme.txt files use
>     removable media (or emulation), and the few that do write to flash
>     have warnings already. The only exception is the Telit EVK-PRO3, so
>     maybe we should just add a warning there.
>
> Well, the few boards we are talking about here are:
> - Telit EVK-PRO3
> - avnet s6lx9_microboard
> - freescale mpc8315erdb
> - freescale p1010rdb
> For the 2 later, there is a warning about the bootloader in the
> readme.txt files,
> for the 2 others, it is not so obvious...

  For the s6lx9 the danger isn't so big because you don't overwrite the 
bootloader.

>
> Anyway, I don't mind adding the warning in the readme files.
> Having it close to the flashing instruction makes sense;
> having it in the documentation (as a genreric warning) makes sense too imho.

  I just don't like scaring people off... But I guess the warning doesn't 
really hurt.

  Regards,
  Arnout

>
> Regards,
>
> --
> Samuel


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
