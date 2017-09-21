From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 23:23:46 +0200
Subject: [Buildroot] [PATCH 1/1] Update github hashes
In-Reply-To: <08b34ae7-9f32-5850-50de-8b6dba321a49@mind.be> (Arnout
 Vandecappelle's message of "Thu, 21 Sep 2017 22:35:28 +0200")
References: <20170920112825.3971-1-bernd.kuhls@t-online.de>
 <87fubhxnnx.fsf@dell.be.48ers.dk>
 <08b34ae7-9f32-5850-50de-8b6dba321a49@mind.be>
Message-ID: <87zi9nsq3h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 20-09-17 19:52, Peter Korsgaard wrote:
 >> I'm not sure updating the hashes is the correct thing to do. Sources.b.o
 >> runs 'make source' from the 2017.02.x and master branches to keep it
 >> uptodate, and E.G. freerdp hasn't been updated since 2017.02, so it will
 >> break hard for 2017.02.x users if we change it.

 >  So perhaps a workaround would be to change the hashes to none instead? That way
 > sources.b.o will retain the original tarballs (since they still have the
 > "correct" hash).

 >  Not changing the hash gives the problem that the packages are downloaded twice:
 > once from github, failing hash, and then again from sources.b.o. For 2017.02.x
 > users that's unavoidable, but for master users we can fix it by changing the
 > hash to none.

 >  Of course, the hash file should then have a comment explaining that the hash
 > should be updated again when the package is bumped.

Yes, that or simply bumping the version on master (or wait for feedback
from github).

-- 
Bye, Peter Korsgaard
