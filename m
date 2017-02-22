From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Feb 2017 14:23:29 +0100
Subject: [Buildroot] [PATCH 1/2 next] Revert "reproducible: fix
	DATE/TIME macros in toolchain-wrapper"
In-Reply-To: <6881dd6c-140a-9cb3-a948-8cb7d0a4a8a4@mind.be> (Arnout
 Vandecappelle's message of "Wed, 22 Feb 2017 12:50:36 +0100")
References: <cover.1487709136.git.yann.morin.1998@free.fr>
 <0db12adda90ffa9bf7a3925cf1563aea4591c5ef.1487709136.git.yann.morin.1998@free.fr>
 <20170221214750.4c057f08@free-electrons.com>
 <20170221205435.GA3347@free.fr>
 <20170221220121.049d38a6@free-electrons.com>
 <6881dd6c-140a-9cb3-a948-8cb7d0a4a8a4@mind.be>
Message-ID: <8737f6nyum.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 21-02-17 22:01, Thomas Petazzoni wrote:
 >> Hello,
 >> 
 >> On Tue, 21 Feb 2017 21:54:35 +0100, Yann E. MORIN wrote:
 >> 
 >>> It is needed to revert this patch in next before applying the following
 >>> patch.
 >> 
 >> Since it has already been reverted in master, I believe we will wait
 >> for the release, and next to be merged in master before applying.

 >  Alternatively, merge master into next now and apply patch 2 to next.

 >  Is there any reason not to regularly merge master into next?

I have no problem doing that if it is useful, but I haven't personally
tried that kind of back/forward merges before. Don't we then end up with
a number of merge commits on next? What happens when next is then merged
back to master?

-- 
Bye, Peter Korsgaard
