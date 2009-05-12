From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 May 2009 12:30:03 +0200
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <200905091050.04559.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Sat\, 9 May 2009 10\:50\:04 +0200")
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
	<87ab5oapss.fsf@macbook.be.48ers.dk>
	<200905091050.04559.markus.heidelberg@web.de>
Message-ID: <87y6t262c4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

Hi,

 >> No, if none of us modify the patch then the git sha1 id will be the
 >> same

 Markus> No, it will be different because of the different committer identity.

Yes ofcourse. I meant that the file (blob) id would be identical.

 Markus> If the changes are the same, there will be no merge conflict,
 Markus> it will be resolved automatically. But it won't ignore a
 Markus> commit, it will leave 2 commits with the same change in the
 Markus> repository, which may be confusing when browsing the history.

Yeah, but if people reply to the patches with a simple "applied to my
tree, thanks" - Then that shouldn't happen often ..

-- 
Bye, Peter Korsgaard
