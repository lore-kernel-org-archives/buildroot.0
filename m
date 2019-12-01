From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Dec 2019 19:11:02 +0100
Subject: [Buildroot] [PATCH] package/openvmtools: only try to start
 vmtoolsd on vmware
In-Reply-To: <20191128155230.7915-1-p.debruijn@unilogic.nl> (Pascal de
 Bruijn's message of "Thu, 28 Nov 2019 16:52:30 +0100")
References: <20191128155230.7915-1-p.debruijn@unilogic.nl>
Message-ID: <87lfrvrk5l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

 > adds ConditionVirtualization=vmware to vmtoolsd.service
 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

Committed, thanks.

-- 
Bye, Peter Korsgaard
