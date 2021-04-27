From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Apr 2021 13:32:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: bump to version
 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
In-Reply-To: <a5e2b86e-834a-6134-03c8-e961197eb37d@mind.be> (Arnout
 Vandecappelle's message of "Tue, 27 Apr 2021 09:34:25 +0200")
References: <20210426101021.2418145-1-romain.naour@gmail.com>
 <20210426101021.2418145-2-romain.naour@gmail.com>
 <e539cd7b-3775-024e-1f9f-67658e38a10b@mind.be>
 <c5b1b792-4ac6-7452-eb36-8c8916413bf0@gmail.com>
 <a5e2b86e-834a-6134-03c8-e961197eb37d@mind.be>
Message-ID: <878s54dktf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I'm not a big fan of not having the glibc version choice. I would prefer having
 >> the choice between the latest version (bleeding-edge) and the previous one
 >> (stable). Bumping Glibc introduce some breaking change that need to be fixed in
 >> several packages.

 >  Although I'm not a fan of version choice at all, there may indeed be a point in
 > having a choice here, because of all the breakage that glibc introduces.

I am also not really in favor. Either we support a glibc version (and
fix whatever breakage it introduces) or we don't.

-- 
Bye, Peter Korsgaard
