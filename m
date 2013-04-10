From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Apr 2013 19:29:58 +0200
Subject: [Buildroot] [PATCH 0/4] External toolchain updates
In-Reply-To: <20130410192424.42ce585c@skate> (Thomas Petazzoni's message of
 "Wed, 10 Apr 2013 19:24:24 +0200")
References: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <877gkazpax.fsf@dell.be.48ers.dk> <20130410192424.42ce585c@skate>
Message-ID: <87y5cqxpih.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> I'm holding on to this for a little while longer until we figure out how
 >> to solve the issues.

 Thomas> I'm not sure what to do with the last patch: the older toolchain is
 Thomas> simply no longer available from git.xilinx.com, and github.com doesn't
 Thomas> allow to download such a big binary blob directly. The only solution
 Thomas> that I can see to keep the old toolchain is to keep the tarballs in
 Thomas> http://sources.buildroot.net (just like we happen to do for the new
 Thomas> Microblaze toolchain). Would you be ok with that?

Sure, I'll put them on sources.buildroot.net tonight.

 Thomas> That said, the old toolchain is not really great to promote to
 Thomas> users either, because it uses a _very_ old glibc that causes a
 Thomas> number of compilation issues with our packages.

Yes, I know :/ From the sound of it, there's issues with the newer
toolchain as well though :/

-- 
Bye, Peter Korsgaard
