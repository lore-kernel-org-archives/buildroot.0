From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 23:30:39 +0200
Subject: [Buildroot] [PATCH v1 2/5] package/docker-containerd: bump to
 version 1.4.0
In-Reply-To: <CA+h8R2pDrOpkaSGsc7oV3tkQ3PT_h8NZjspDLxkSq1r_9RnReQ@mail.gmail.com>
 (Christian Stewart's message of "Tue, 15 Sep 2020 14:15:34 -0700")
References: <20200913001659.472814-1-christian@paral.in>
 <20200913001659.472814-2-christian@paral.in>
 <87ft7iswih.fsf@dell.be.48ers.dk>
 <CA+h8R2pDrOpkaSGsc7oV3tkQ3PT_h8NZjspDLxkSq1r_9RnReQ@mail.gmail.com>
Message-ID: <87h7ryram8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi Peter,
 > On Tue, Sep 15, 2020, 11:52 AM Peter Korsgaard <peter@korsgaard.com> wrote:

 >> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
 >> 
 >> > Signed-off-by: Christian Stewart <christian@paral.in>
 >> 
 >> Is this a dependency for the docker-cli / docker-engine bumps? From the
 >> looks of it, it isn't?
 >> 

 > It's not necessarily a dependency but I cannot understand why you would
 > chose to not update it at the same time.

Ehh, containerd 1.2.x -> 1.4.0 brings quite a lot of changes and new
code:

https://github.com/containerd/containerd/releases/tag/v1.4.0

So this is normally not something we do for the stable branches.

-- 
Bye, Peter Korsgaard
