From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jan 2016 20:45:46 +0100
Subject: [Buildroot] [PATCH 3/3] vboot-utils: remove hash file
In-Reply-To: <56845669.3050005@mind.be> (Arnout Vandecappelle's message of
 "Wed, 30 Dec 2015 23:10:49 +0100")
References: <cover.1451483256.git.alex.suykov@gmail.com>
 <05e1570e0377fc9e913819765ecb8e488b6b6c1a.1451483256.git.alex.suykov@gmail.com>
 <20151230160016.14524b1f@free-electrons.com>
 <56844F79.3080903@mind.be>
 <20151230225333.171a6c4c@free-electrons.com>
 <56845669.3050005@mind.be>
Message-ID: <87k2ntrslx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  So I think now we can safely conclude that a hash file should be
 > added for all packages, even if it just contains 'none' hashes. It is
 > definitely an advantage to be able to distinguish packages that
 > should still get a hash from packages of which we already decided
 > that the hash should be 'none'.

Yes, makes sense to me.

-- 
Bye, Peter Korsgaard
