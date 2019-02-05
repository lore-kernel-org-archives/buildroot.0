From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 17:59:38 +0100
Subject: [Buildroot] [PATCH] utils/test-pkg: clean output dir for
 successful builds
In-Reply-To: <59dd171a-aa7d-1684-969e-e3d3cf3c3ece@mind.be> (Arnout
 Vandecappelle's message of "Tue, 5 Feb 2019 17:55:20 +0100")
References: <20190205161605.1331-1-patrickdepinguin@gmail.com>
 <59dd171a-aa7d-1684-969e-e3d3cf3c3ece@mind.be>
Message-ID: <87zhrakw79.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 05/02/2019 17:16, Thomas De Schampheleire wrote:
 >> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 >> 
 >> test-pkg will use gigabytes of space when testing all toolchains.
 >> Nevertheless, you are normally only interested in the actual build / host
 >> tree when there is a build failure.

 >  Well, except in the situation where you're iteratively fixing the package and
 > re-testing with the -p option, no? Then your subsequent attempt would be happy
 > to reuse the build results of all dependencies...

 >  So, I think it's better to make this optional - perhaps with a -k,--keep option
 > similar to run-tests.

Agreed!

-- 
Bye, Peter Korsgaard
