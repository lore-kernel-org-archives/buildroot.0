From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 09:52:59 +0200
Subject: [Buildroot] [PATCH] fmc and fmlib: bump version to fsl-sdk-v2.0
In-Reply-To: <1469564436-5079-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1469564436-5079-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160727095259.38202964@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 15:20:36 -0500, Matt Weber wrote:
> From: Ronak Desai <ronak.desai@rockwellcollins.com>
> 
> Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Thanks for this patch. However, unless the two package bumps are
inter-related (i.e they cannot be made independently from each other),
we prefer to have one patch for each bump.

Also, while you're at it, could you add a hash file to these packages?
The Buildroot method for generating tarballs from Git repositories now
guarantees that the tarballs are reproducible, so we can add hash files
as well.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
