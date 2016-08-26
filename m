From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Aug 2016 11:27:02 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build with uClibc
In-Reply-To: <57C005B7.9090306@imgtec.com> (Rahul Bedarkar's message of "Fri, 
 26 Aug 2016 14:32:47 +0530")
References: <1472144466-17003-1-git-send-email-rahul.bedarkar@imgtec.com>
 <878tvkecij.fsf@dell.be.48ers.dk>
 <20160826105648.65579c15@free-electrons.com>
 <57C005B7.9090306@imgtec.com>
Message-ID: <87eg5bdgnt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rahul" == Rahul Bedarkar <Rahul.Bedarkar@imgtec.com> writes:

Hi,

 >> And actually I had to fix up the patch, because it was not applying
 >> properly. See
 >> https://git.buildroot.org/buildroot/commit/?id=397962ce1737ba0f920ffc1d3a3ea2bc08b28270
 >> for all the details.
 >> 
 >> Rahul, did you actually test the patch? It didn't apply to the domoticz
 >> source code extracted from the tarball, causing an immediate build
 >> failure.
 >> 

 > Yes, I had tested patch. It was applied cleanly in my case. Not sure
 > why it hasn't failed for me.

I think the dos newlines got dropped by patchwork. We had similar issues
in the past.

-- 
Venlig hilsen,
Peter Korsgaard 
