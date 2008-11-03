From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Nov 2008 13:25:17 +0100
Subject: [Buildroot] [PATCH] qtopia4: fix wrong variable name for SQL
In-Reply-To: <d6cda7730811030413j1761701by6efebb6897b59f9@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Mon\, 3 Nov 2008
	10\:13\:46 -0200")
References: <200810310118.50847.markus.heidelberg@web.de>
	<d6cda7730810301931q61359abdva18447d940267043@mail.gmail.com>
	<200811011209.02562.markus.heidelberg@web.de>
	<87abciz0t5.fsf@macbook.be.48ers.dk>
	<d6cda7730811030413j1761701by6efebb6897b59f9@mail.gmail.com>
Message-ID: <87iqr5f13m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Markus> I prefer inline patches, for easier commenting for example. I
 Markus> also find attachments are quite annoying if I have to use the
 Markus> web archives and can't just read the patch but have to
 Markus> download it at first. I know Peter prefers inline for the
 Markus> ease of applying them with "git am" and he has already
 Markus> applied a few from me.
 >> 
 >> Exactly!

 Thiago> I don't use git, and I guess I never will *smile*.

Pity, you're missing out on good stuff. It's quite easy to get started
with git-svn.

 Thiago> I agree it's best for commenting, but if it were also as well
 Thiago> easier to apply, then it means the submitter doesn't have to
 Thiago> wait for Peter to have the time to check it. I or someone
 Thiago> else with the same problem as me could do it.

patch -p1 < mail afaik still works, but then you ofcourse have to do
the manual svn add / copy commit message ritual.

 >> Thiago, what keeps you from using a proper email client?
 
 Thiago> I get rejects whenever I try to apply those git generated patches. It
 Thiago> just occured to me that maybe if I use the "show original" in the
 Thiago> gmail and copy from that it should work better. Will see in the next
 Thiago> patches if this works ;)

Do you apply them with patch -p1 ?

About cut'n'paste - Careful that you don't get tabs converted to white
space on the way.

-- 
Bye, Peter Korsgaard
