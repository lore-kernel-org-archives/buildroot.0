From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 23:21:45 +0100
Subject: [Buildroot] [PATCH] btrfs-progs: fix build with e2fsprogs 1.44.0
In-Reply-To: <914be051e2dd48e6d9ce64c0374d2739b3f5c69a.1521481449.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 19 Mar 2018 19:44:09 +0200")
References: <914be051e2dd48e6d9ce64c0374d2739b3f5c69a.1521481449.git.baruch@tkos.co.il>
Message-ID: <87k1u7ln9i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > e2fsprogs 1.44.0 renamed a struct field name, breaking the build of code
 > using it. Add a patch suggested upstream to fix that.

 > Fixes:
 > http://autobuild.buildroot.net/results/d6b/d6b5fb377f44d0b6eef96c08e550ec7277a9e3cd/
 > http://autobuild.buildroot.net/results/651/651518f12b8a98d53cb5402445a476bd2bf32155/
 > http://autobuild.buildroot.net/results/3c7/3c771455cbc8460fffab6c4dd9835ee4a5776c19/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
