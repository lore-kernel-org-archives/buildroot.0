From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 11:26:59 +0200
Subject: [Buildroot] [PATCH v4 06/15] arch: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_9
In-Reply-To: <20190622214123.01ff23dc@windsurf> (Thomas Petazzoni's message of
 "Sat, 22 Jun 2019 21:41:23 +0200")
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-7-giulio.benetti@micronovasrl.com>
 <20190622214123.01ff23dc@windsurf>
Message-ID: <877e9cfy8s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Applied to master, thanks. Shouldn't we be using this a bit more ?

 > I believe C-SKY could select BR2_ARCH_NEEDS_GCC_AT_LEAST_9, and ARC
 > could select BR2_ARCH_NEEDS_GCC_AT_LEAST_8, this would allow to remove
 > a few "depends !" from package/gcc/Config.in.host.

Yes, that could be a nice cleanup - Even though we don't have a lot of
such conditionals.

-- 
Bye, Peter Korsgaard
