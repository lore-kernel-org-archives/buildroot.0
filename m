From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Feb 2018 20:28:02 +0100
Subject: [Buildroot] [PATCH 1/1] drbd-utils: bump version to 9.2.0
In-Reply-To: <20180201093704.16452-1-cvubrugier@fastmail.fm> (Christophe
 Vu-Brugier's message of "Thu, 1 Feb 2018 10:37:04 +0100")
References: <20180201093704.16452-1-cvubrugier@fastmail.fm>
Message-ID: <87d11l3mbh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christophe" == Christophe Vu-Brugier <cvubrugier@fastmail.fm> writes:

 > Also update the download URL.
 > This patch fixes many autobuild failures because drbd-utils packages
 > older than 8.9.9 are no longer provided by linbit.com.

 > Fixes:
 > http://autobuild.buildroot.net/results/a6d61c7ca8e505509d84869f072d812da79e949a
 > http://autobuild.buildroot.net/results/53ea7cfc57d912377b566474b15a47ffc077b047
 > http://autobuild.buildroot.net/results/3a6d7a384e6558156695b6ac46754976f4db7652
 > http://autobuild.buildroot.net/results/0576b80240ba439f7c2842a58e8bd418199e6100
 > http://autobuild.buildroot.net/results/3f9db30f18b58a6258acb5dfb9301936e5e05bf6

Normally such issues are not fatal, but we had a problem with
sources.buildroot.net a few days ago.

Committed, thanks.

-- 
Bye, Peter Korsgaard
