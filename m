From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 21:24:36 +0100
Subject: [Buildroot] [PATCH] fs/iso9660: md5 checksum boot dir files
In-Reply-To: <1478884419-22717-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1478884419-22717-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20161111212436.16bd7898@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 11:13:39 -0600, Matt Weber wrote:
> From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> 
> Generate md5 checksum for all files of boot directory
> to allow runtime validation of boot images.
> 
> Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Why specifically for those images, and not all files of the filesystem?

This really looks like a very use-case specific problem, we certainly
can't handle it in generic code like this the patch you're proposing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
