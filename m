From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Sep 2011 22:18:42 +0200
Subject: [Buildroot] [PATCH 2/5] rtai,
	xenomai: use the pre patch hook point
In-Reply-To: <40ab53037f455a50bfbd5430bed946fccd0298ea.1316463052.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Sep 2011 22:10:53 +0200")
References: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
 <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
 <40ab53037f455a50bfbd5430bed946fccd0298ea.1316463052.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87zkhz2cil.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The post extract hook point is not really correct as what RTAI and
 Thomas> Xenomai extensions are doing is patching the kernel.

 Thomas> The post patch hook point doesn't work, because RTAI and Xenomai
 Thomas> patches would be applied *after* all other patches, while it sounds
 Thomas> more logical to apply them first, and *then* allow the user to apply
 Thomas> some platform/board specific patches if needed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
