From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 00:32:26 +0200
Subject: [Buildroot] [PATCH] 2017.02.x: update hash file for libnl
	3.2.27 patch
In-Reply-To: <20170702235512.723ed0da@windsurf> (Thomas Petazzoni's message of
 "Sun, 2 Jul 2017 23:55:12 +0200")
References: <1498841436-24941-1-git-send-email-julien.boibessot@free.fr>
 <20170702235512.723ed0da@windsurf>
Message-ID: <87r2xy8o79.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > So, like we are about to do in the master branch for all packages, what
 > we are going to do here is that we will bring the libnl patch inside
 > package/libnl/ instead of downloading it from Github.

 > Peter Korsgaard will work on this soon. In the mean time, I'll mark
 > your patch as Rejected in patchwork.

FYI, I've pushed a patch doing this:

https://git.buildroot.net/buildroot/commit/?h=2017.02.x&id=6826e2ee8a2bc09104185c777a4ff57bc6a78872

-- 
Bye, Peter Korsgaard
