From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Mar 2012 00:22:51 +0100
Subject: [Buildroot] [PATCH 1/1] liburcu: only some architectures are
	supported
In-Reply-To: <fc4890c5ea038002f049d4accc61c6274fd566d2.1332231460.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 20 Mar 2012 09:17:46 +0100")
References: <cover.1332231460.git.thomas.petazzoni@free-electrons.com>
 <cover.1332231460.git.thomas.petazzoni@free-electrons.com>
 <fc4890c5ea038002f049d4accc61c6274fd566d2.1332231460.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87obrqj1ro.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Make sure that liburcu (and the packages that select it) cannot be
 Thomas> enabled on the architectures that are not supported. At the moment,
 Thomas> only x86, x86-64, PowerPC and ARM are supported.

Committed with the addition of armeb, thanks.

-- 
Bye, Peter Korsgaard
