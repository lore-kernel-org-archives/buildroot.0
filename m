From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Aug 2014 23:30:35 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 3.16,
	fix static linking
In-Reply-To: <1409403104-23599-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 30 Aug 2014 14:51:44 +0200")
References: <1409403104-23599-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wq9poebo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The original aim of this patch was to fix static linking of
 > btrfs-progs. In order to implement this in the form of patches that
 > can potentially be upstreamed, this patch first bumps the btrfs-progs
 > package to the latest upstream stable version. It then:

 >  - Reworks the existing documentation disabling patch in a form that
 >    can potentially be upstreamed.

 >  - Adds a patch to support static building of the btrfs-progs
 >    binaries.

 > Both patches have been submitted upstream, see
 > http://article.gmane.org/gmane.comp.file-systems.btrfs/38145.

 > Fixes:

 >   http://autobuild.buildroot.org/results/ddc/ddcc70143ce2c2882894184e4ce195a11407e027/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
