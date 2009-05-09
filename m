From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 9 May 2009 10:50:04 +0200
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <87ab5oapss.fsf@macbook.be.48ers.dk>
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
	<87ab5oapss.fsf@macbook.be.48ers.dk>
Message-ID: <200905091050.04559.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 08.05.2009:
> >>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>  Thiago> Anyway, what happens if I apply a patch and then you apply it
>  Thiago> a while later before pulling from my tree? I guess we will
>  Thiago> conflict right?
> 
> No, if none of us modify the patch then the git sha1 id will be the
> same

No, it will be different because of the different committer identity.

> and the commit just ignored (if one of us modifies it you will
> most likely get a merge conflict that you'll have to resolve when you
> rebase your changes against me).

If the changes are the same, there will be no merge conflict, it will be
resolved automatically. But it won't ignore a commit, it will leave 2
commits with the same change in the repository, which may be confusing
when browsing the history.

Markus
