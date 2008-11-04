From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Tue, 4 Nov 2008 01:45:09 +0100
Subject: [Buildroot] [PATCH] qtopia4: fix wrong variable name for SQL
In-Reply-To: <d6cda7730811030413j1761701by6efebb6897b59f9@mail.gmail.com>
References: <200810310118.50847.markus.heidelberg@web.de>
	<87abciz0t5.fsf@macbook.be.48ers.dk>
	<d6cda7730811030413j1761701by6efebb6897b59f9@mail.gmail.com>
Message-ID: <200811040145.09758.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thiago A. Corr?a, 03.11.2008:
> >>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> >
> >  >> Btw, could you send patches as attachments (instead or as well)? Not
> >  >> sure how others prefers them,
> >
> >  Markus> I prefer inline patches, for easier commenting for example. I
> >  Markus> also find attachments are quite annoying if I have to use the
> >  Markus> web archives and can't just read the patch but have to
> >  Markus> download it at first. I know Peter prefers inline for the
> >  Markus> ease of applying them with "git am" and he has already
> >  Markus> applied a few from me.
> >
> > Exactly!
> 
> I don't use git, and I guess I never will *smile*.

Please don't say so, you only put yourself into constraints. When working with
svn, I wouldn't be able to create patch series. Nor working on different
issues at once without duplicating the tree. Just because I can't commit
locally. Even with svn commit access I wouldn't use svn directly. Often you
want to backup small incremental changes, but send one single patch upstream.
It seems a couple of people are working in this fashion.

But of course you don't have to use git. Inline patches don't have anything to
do with git, they are much older.

> I agree it's best for commenting, but if it were also as well easier
> to apply, then it means the submitter doesn't have to wait for Peter
> to have the time to check it. I or someone else with the same problem
> as me could do it.

It IS easy to apply. You are the first person I hear complaining about inline
patches. Use a mail client instead of the web interface, saving the mail
should be exactly the same effort as saving an attached patch. Web interfaces
are fine for reading mails from all over the world but are crap for working
with.

> >  >> Also, I don't trust copy and paste
> >  >> to not mess with the whitespaces and tabs.... If I do mess them up
> >  >> others jump on my neck. Whitespace damage is sort of worst than having
> >  >> a non working package around here *smile*.
> >
> >  Markus> If whitespace is damaged after copy and paste, you will
> >  Markus> notice it when applying the malformed patch.
> >
> > Yes.
> >
> > Thiago, what keeps you from using a proper email client?
> >
> 
> I get rejects whenever I try to apply those git generated patches. It
> just occured to me that maybe if I use the "show original" in the
> gmail and copy from that it should work better. Will see in the next
> patches if this works ;)

If I'd attach the patch, it would also be "git generated". If not damaged
whitespace, maybe it was just the -p option as supposed by Peter.

Markus
