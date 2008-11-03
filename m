From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 3 Nov 2008 10:13:46 -0200
Subject: [Buildroot] [PATCH] qtopia4: fix wrong variable name for SQL
In-Reply-To: <87abciz0t5.fsf@macbook.be.48ers.dk>
References: <200810310118.50847.markus.heidelberg@web.de>
	<d6cda7730810301931q61359abdva18447d940267043@mail.gmail.com>
	<200811011209.02562.markus.heidelberg@web.de>
	<87abciz0t5.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730811030413j1761701by6efebb6897b59f9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
>
> Hi,
>
>  >> Btw, could you send patches as attachments (instead or as well)? Not
>  >> sure how others prefers them,
>
>  Markus> I prefer inline patches, for easier commenting for example. I
>  Markus> also find attachments are quite annoying if I have to use the
>  Markus> web archives and can't just read the patch but have to
>  Markus> download it at first. I know Peter prefers inline for the
>  Markus> ease of applying them with "git am" and he has already
>  Markus> applied a few from me.
>
> Exactly!

I don't use git, and I guess I never will *smile*.

I agree it's best for commenting, but if it were also as well easier
to apply, then it means the submitter doesn't have to wait for Peter
to have the time to check it. I or someone else with the same problem
as me could do it.

>  >> Also, I don't trust copy and paste
>  >> to not mess with the whitespaces and tabs.... If I do mess them up
>  >> others jump on my neck. Whitespace damage is sort of worst than having
>  >> a non working package around here *smile*.
>
>  Markus> If whitespace is damaged after copy and paste, you will
>  Markus> notice it when applying the malformed patch.
>
> Yes.
>
> Thiago, what keeps you from using a proper email client?
>

I get rejects whenever I try to apply those git generated patches. It
just occured to me that maybe if I use the "show original" in the
gmail and copy from that it should work better. Will see in the next
patches if this works ;)
