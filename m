From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 14:16:13 +0100
Subject: [Buildroot] RFC: Patch series for Kodi 16-Jarvis
In-Reply-To: <20151220130054.GC3677@free.fr>
References: <3sigkcxlsq.ln2@ID-313208.user.individual.net>
 <vjiikcxh6u.ln2@ID-313208.user.individual.net>
 <20151220135412.652a8344@free-electrons.com>
 <20151220130054.GC3677@free.fr>
Message-ID: <20151220141613.22b22bdc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Dec 2015 14:00:54 +0100, Yann E. MORIN wrote:

> Well, I'm not too fond of that. But indeed, it's a pain to review either
> way.
> 
> Maybe a middle-ground solution would be to bump all the screensavers in
> one patch, all the audiocoders in a second one and so on?

I'm fine with this, but I'd like to keep my request to have the "simple
bumps" grouped together in certain commits, but as soon as the bump is
not just a mechanical one, it should be a separate patch. I.e for
example:

	kodi-screensaver-*: mechanical bumps
	kodi-screensaver-baz: bump version

> Also, I'm not too fond of doing reviews on a github repository. I'd
> largely prefer we have a complete RFC series on the list, otherwise the
> reviews are lost. For example, I now can't see what Thomas as said,
> since the branch has been rebased and previous comments are lost.

I think Bernd's intention was just to announce that he was going to
post all the patches as soon as Kodi 16 was out, but he wants to wait
for that release to happen before posting 100 patches on the list.

But by grouping package bumps a little bit, the size of the series
would be a lot shorter, and it would therefore be a bit more acceptable
to post such an RFC series on the list.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
