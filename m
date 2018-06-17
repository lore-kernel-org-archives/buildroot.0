From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:55:41 +0200
Subject: [Buildroot] [PATCH 4/4] autofs: depend on host-nfs-utils
In-Reply-To: <2dca4fb600a77a0ac01b225a30d137b8721ff3fe.1526643119.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 18 May 2018 14:31:59 +0300")
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
 <2dca4fb600a77a0ac01b225a30d137b8721ff3fe.1526643119.git.baruch@tkos.co.il>
Message-ID: <871sd5v4wi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > host-nfs-utils provides the host rpcgen utility. This fixes the build on
 > recent Fedora systems that removed rpcgen from the glibc package.

 > Fixes:
 > http://autobuild.buildroot.net/results/383/383bc8462f32a226645c9b792b8d65a25d74529d/
 > http://autobuild.buildroot.net/results/0c0/0c00f72512754b721813e13f0828d3a942f7b955/
 > http://autobuild.buildroot.net/results/50b/50b66d2a3c8264f618d7aa813b10050ed147209f/

 > Cc: Jonathan Ben Avraham <yba@tkos.co.il>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
