From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Nov 2011 17:17:00 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <4EB3D2F1.3010206@comelit.it> (Luca Ceresoli's message of "Fri,
 04 Nov 2011 12:56:33 +0100")
References: <20111102160349.4afe5935@skate> <4EB3D2F1.3010206@comelit.it>
Message-ID: <87d3d3ewlf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca.ceresoli@comelit.it> writes:

Hi,

 >> It is also not clear yet what the output of this report should be. On
 >> one side, Thomas Petazzoni proposed that it generates an HTML document
 >> inside a directory with all the tarballs and all the patches for the
 >> different components. On the other side, Peter Korsgaard proposed that
 >> a report be generated, but only with a list of tarballs, leaving the
 >> user the work of putting the tarballs together. For Peter, there is no

 Luca> I can't see any drawback of having Buildroot put together the
 Luca> tarballs.  It's boring for a man, and I suppose it would be easy
 Luca> to implement in Buildroot.

My point was simply that the easiest / safest-from-a-legal-pov would
just be for people to provide their entire buildroot tree rather than
trying to pick out individual patches.

 Luca> I think this would be illegal, at least according to the GPLv2:

 Luca>   "For an executable work, complete source code means all the source
 Luca>   code for all modules it contains, plus any associated interface
 Luca>   definition files, plus the scripts used to control compilation and
 Luca>   installation of the executable."

 Luca> My understanding is that Buildroot is exactly "the scripts used to
 Luca> control compilation and installation", so the patches that exist in
 Luca> Buildroot should be released as well.

That's how I read it as well (but IANAL) and how I handle it at work -
E.G. supply buildroot together with the other upstream tarballs.

-- 
Bye, Peter Korsgaard
