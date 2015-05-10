From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 10 May 2015 12:00:17 +0200
Subject: [Buildroot] Proposal to remove patches from patchwork,
	or find adopters
In-Reply-To: <20150506235353.7740a9d3@free-electrons.com>
References: <20150506235353.7740a9d3@free-electrons.com>
Message-ID: <CAAXf6LW2v0PG4mWR_WV=G_iFuu=C_7DcwxTy=kBmmvfq=Jt8Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On May 6, 2015 11:53:53 PM CEST, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>Hello,
>
>On April 21th, I sent a personal reminder to all the patch authors who
>had patches older than 15 days pending in Buildroot's patchwork.
>
>Since then, a number of authors have responded to indicate whether they
>are still interested or not by their patches, which is great.
>
>However, a fairly significant portion of the patches have not been
>given any feedback by their respective authors. I have triaged the
>answers from the authors, and classified such patches. The list of such
>patches follows. Note that the authors of such patches are again added
>in the To: field of this e-mail, to get their attention.
>
>I hereby propose to mark all those patches as "Rejected" on May 21 (i.e
>one month after the reminder), if the authors still haven't expressed
>interest and nobody else volunteered to adopt the patch. I believe we
>can't keep for months or years patches that the original author has
>lost interest in, and nobody else seems to be interested in.
>
>Let me know if you agree or disagree with this proposal.
>
>Volunteers interested in adopting one or several of the below patches,
>please speak up.
>
>Here is the list of such patches:

>* [PATCHv3,for,next,1/2] toolchain-external: improve lib subdirectory
>matching
>* [PATCHv3,for,next,2/2] toolchain: create symlink to 'lib' from
>ARCH_LIB_DIR iso fixed lib32/lib64

Sorry for my late reply.
These patches are still relevant and I think they should be applied. I
recall you telling me on IRC that you had an odd feeling about the
entire external toolchain directory matching, but I think it's the
reality we're in and there is nothing extraordinary going on in these
patches so that it could be a basis to reject them.

I just checked and they still apply on top of master.

What is your opinion here? Is there anything I can do?

Thanks,
Thomas
