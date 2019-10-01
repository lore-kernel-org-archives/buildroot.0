From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2019 07:19:32 +0200
Subject: [Buildroot] [PATCH] package/cifs-utils: bump to version 6.9
In-Reply-To: <20190930072242.19469-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 30 Sep 2019 09:22:42 +0200")
References: <20190930072242.19469-1-thomas.petazzoni@bootlin.com>
Message-ID: <87o8z111qz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > From https://wiki.samba.org/index.php/LinuxCIFS_utils:
 > - April 5, 2019: Release 6.9
 >   - smbinfo utility is added to query various kinds of information
 >     from the server (objectId, snapshots, different FileInfo* classes
 >     and other metadata)
 >   - server IP change is supported by expiring DNS key resolver entries
 >   - get/setcifsacl tools are improved to handle unexpected behavior
 >   - share snapshot are allowed to be specified by a GMT token or SMB
 >     100-nanoseconds time
 >   - various new mount option are documented: bsize, handletimeout,
 >     handlecache, rdma, max_credits and others
 >   - https://lists.samba.org/archive/samba-technical/2019-April/133233.html

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
