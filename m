From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:33:36 +0200
Subject: [Buildroot] [PATCH v4 1/9] Makefile,
 skeleton: move the host skeleton logic to host-skeleton package
In-Reply-To: <20180325165940.4eb1daa0@windsurf> (Thomas Petazzoni's message of
 "Sun, 25 Mar 2018 16:59:40 +0200")
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-2-thomas.petazzoni@bootlin.com>
 <87r2o8xqbc.fsf@dell.be.48ers.dk> <20180325165940.4eb1daa0@windsurf>
Message-ID: <87605kxj8v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Sun, 25 Mar 2018 15:00:55 +0200, Peter Korsgaard wrote:

 >> Thinking about that, why don't we just make the sdk target depend on
 >> host-patchelf instead of always building it just in case somebody will
 >> ever run 'make sdk'?

 > We use patchelf in target-finalize to fix rpath in the target folder,
 > so it's not only used for "make sdk".

Ahh yes, correct.

-- 
Bye, Peter Korsgaard
