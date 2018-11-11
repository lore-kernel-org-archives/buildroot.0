From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Nov 2018 21:03:43 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <90236f5b-e72e-e73a-b4fa-e982ee3cc42c@mind.be> (Arnout
 Vandecappelle's message of "Sun, 11 Nov 2018 17:02:59 +0100")
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <762db85d-d4a9-95b5-8280-d46dfd5f2a72@mind.be>
 <20181110175724.GG2445@scaer>
 <90236f5b-e72e-e73a-b4fa-e982ee3cc42c@mind.be>
Message-ID: <87in135qlc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 10/11/2018 18:57, Yann E. MORIN wrote:
 >> Arnout, All,
 >> 
 >> On 2018-11-08 00:43 +0100, Arnout Vandecappelle spake thusly:
 > [snip]
 >>> Still, I'd prefer to fix fakeroot :-)
 >> 
 >> Then, please be my guest! ;-) I already fixed something in fakeroot, and
 >> I dread working on that code base any more...

 >  Time to switch to pseudo? The .11-rc period is ideal for that, isn't it? :-)

I see the smiley, but does pseudo correctly handle xattrs/capabilities?

-- 
Bye, Peter Korsgaard
