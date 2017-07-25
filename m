From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:06:02 +0200
Subject: [Buildroot] [git commit] libmemcached: fix build with gcc 7.x
In-Reply-To: <20170721211945.D8B148163D@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 21 Jul 2017 23:22:47 +0200")
References: <20170721211945.D8B148163D@busybox.osuosl.org>
Message-ID: <87r2x4xjcl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=8786ac28058aa553cfa8adc176952143af630af6
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This commit adds a patch to the libmemcached package that fixes the
 > build with gcc 7.x. Since libmemcached is barely maintained upstream,
 > the patch comes from the Fedora packages.

 > Fixes:

 >   http://autobuild.buildroot.net/results/872b8e0e6a24cbc96e3ad9e0b8b47acdf6160ce0/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
