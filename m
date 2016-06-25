From: daggs <daggs@gmx.com>
Date: Sat, 25 Jun 2016 15:13:56 +0200
Subject: [Buildroot] [PATCH 3/4 v3] libamcodec: New Package
In-Reply-To: <b8924dx4on.ln2@ID-313208.user.individual.net>
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-3-daggs@gmx.com>,
 <b8924dx4on.ln2@ID-313208.user.individual.net>
Message-ID: <trinity-e38595ae-55b0-42a4-8b11-39fa67cb0204-1466860436280@3capp-mailcom-bs12>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> Am Fri, 24 Jun 2016 21:22:55 +0300 schrieb Dagg Stompler:
> 
> > v2 -> v3:
> >  - fix sum256 value.
> >  - fix patch.
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > ---
> >  package/Config.in                                  |  1 +
> >  ...-fix-makefiles-to-allow-cross-compilation.patch | 96
> >  ++++++++++++++++++++++ package/libamcodec/Config.in                    
> 
> Hi,
> 
> the patch fails to apply:
> 
> Applying 0001-libamcodec-fix-makefiles-to-allow-cross-compilation.patch 
> using patch: 
> patching file amadec/Makefile
> patching file amavutils/Makefile
> patching file amcodec/Makefile
> Hunk #1 FAILED at 27 (different line endings).
> 1 out of 1 hunk FAILED -- saving rejects to file amcodec/Makefile.rej
> patching file amcodec/rules.mk
> Hunk #1 FAILED at 2 (different line endings).
> 1 out of 1 hunk FAILED -- saving rejects to file amcodec/rules.mk.rej
> Patch failed!  Please fix 0001-libamcodec-fix-makefiles-to-allow-cross-
> compilation.patch!
> 
> I applied the patch using this command:
> 
> wget http://patchwork.ozlabs.org/patch/640344/mbox/ -O - | git am
> 
> Regards, Bernd
> 
that is exactly why I've fixed the patch, for the same reasons. I'm pretty sure I've tested it from scratch and it worked. maybe something went bad it the email of the patch.... 
as Thomas mentioned, the file is written in dos mode, thus it has ^M at the end, I've already pinged the maintainer on submitting patches to the repo.
waiting for the answer.

on the bright side, is seems that the license of this pkg is going to be dual gpl/bsd, no official word yet.

Dagg.
