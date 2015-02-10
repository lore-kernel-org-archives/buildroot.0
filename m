From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Feb 2015 15:31:36 +0000 (UTC)
Subject: [Buildroot] [Bug 7772] libxml-parser-perl build failure: missing
 dependency ExtUtils/MakeMaker
In-Reply-To: <bug-7772-163@https.bugs.busybox.net/>
References: <bug-7772-163@https.bugs.busybox.net/>
Message-ID: <20150210153136.C133880E35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7772

--- Comment #3 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-02-10 15:31:36 UTC ---
(In reply to comment #2)
> Vicente, saiberion: would you mind sending the proposed patch to the mailing
> list?

Hello Thomas,

shouldn't we have an agreement on what would be the solution to this?

a) adding the perl-ExtUtils-MakeMaker package to Buildroot
b) adding a dependency check as saiberion did

I personally don't like the option b), because I like to be able to use
Buildroot having the minimum packages installed. And, if we keep doing this, we
could end with a loooong list of dependencies to use Buildroot. I think it's
better to add the perl-ExtUtils-MakeMaker instead.

Maybe Francois Perrad has something to say about this since he seems to be the
perl maintaner in Buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
