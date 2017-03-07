From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 16:42:32 +0100
Subject: [Buildroot] [PATCH] odroid-mali: mark package as BROKEN
In-Reply-To: <20170305223726.GM3671@free.fr> (Yann E. MORIN's message of "Sun, 
 5 Mar 2017 23:37:27 +0100")
References: <1488638059-6764-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170305213723.021d4678@free-electrons.com>
 <b81cad7b-504e-b927-3f62-844925aba881@mind.be>
 <20170305223726.GM3671@free.fr>
Message-ID: <87a88xccuv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> I'm obviously late with commenting on this, but I think marking things as
 >> BROKEN is wrong. It bypasses the legacy mechanism so it disappears without
 >> notice. Also, BROKEN packages languish there for years without ever anyone
 >> taking a look. Sometimes things do get repaired, but re-adding the package is
 >> not much more complicated than
 >> 
 >> So, I propose to remove all broken packages.

 > Agreed.

 >> [I have the feeling we discussed this kind of thing at some BR devel meeting at
 >> some point, but I can't find it.]

 > Yes we did. And IIRC we agreed to get rid of BROKEN altogether.

I think you are mixing it up with BR2_DEPRECATED.

With that said, if nobody cares about fixing the package, then I'm OK
with removing it. Lets give it a bit of time and see what happens.

-- 
Bye, Peter Korsgaard
