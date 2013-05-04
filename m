From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 May 2013 22:38:49 +0200
Subject: [Buildroot] [PATCH] dmalloc: Stop libdmalloc*.so files from
	being deleted from staging directory
In-Reply-To: <069B5A25F9844945B625ADE7258AC94C061E73B0@4rf-nz-orion.local.4rf.com>
 (Reuben Dowle's message of "Thu, 14 Feb 2013 01:12:02 +0000")
References: <069B5A25F9844945B625ADE7258AC94C061E73B0@4rf-nz-orion.local.4rf.com>
Message-ID: <871u9msco6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Reuben" == Reuben Dowle <reuben.dowle@4rf.com> writes:

 Reuben> Fix libdmalloc*.so files being deleted from the staging
 Reuben> directory as the package is installed into the target.

 Reuben> Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com>

Committed, thanks.

Please consider using git-send-email / not through exchange next time,
as the patch was corrupted (tabs converted to spaces) and I had to fix
it up manually.

-- 
Bye, Peter Korsgaard
