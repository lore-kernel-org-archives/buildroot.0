From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Sep 2011 10:53:23 +0200
Subject: [Buildroot] [PATCH 01/15] package: show complete URL for
	external-deps
In-Reply-To: <20110917091333.6d80760b@skate> (Thomas Petazzoni's message of
 "Sat, 17 Sep 2011 09:13:33 +0200")
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <9a55925fbd5588fb01890a48d15a46b06c93fed4.1314826231.git.thomas.petazzoni@free-electrons.com>
 <87zki3wuhj.fsf@macbook.be.48ers.dk> <20110917091333.6d80760b@skate>
Message-ID: <87mxe3wnwc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> For all of those the upstream URL isn't really interesting

 Thomas> Ok. To me this sounds like a strange behaviour for something called
 Thomas> "external-deps", I would have expected to see the *external*
 Thomas> dependencies, i.e what I need from the Internet, besides Buildroot, to
 Thomas> be able to build my system.

Well, that's what they show, just the downloaded version of it. It is
mainly useful if you use a shared download dir as it will contain a
bunch of unrelated stuff.

I'm not sure if a show-me-what-make-source-would-do target
(E.G. something showing the upstream URLs) would be useful enough to be
worth adding.

 >> - Perhaps we should fix the svn/bzr/git helpers instead?

 Thomas> What should they show ? The name of the local tarball that has been
 Thomas> created after the svn checkout / git clone ?

Yes.

 Thomas> And what should we display in the case of a local package (as added by
 Thomas> this patchset) ?

That's a good question - The path to the directory perhaps?

-- 
Bye, Peter Korsgaard
