From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 14:41:02 +0200
Subject: [Buildroot] [PATCH v4] iperf: fix "speed" display in csv report
In-Reply-To: <1469750949-64127-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1469750949-64127-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160730144102.47f40b69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 19:09:09 -0500, Matt Weber wrote:
> Some parameters displayed in the CSV reports are declared
> as uint64_t, but the printf format doesn't reflect this.
> 
> Submitted bug: https://sourceforge.net/p/iperf/bugs/66/
> 
> Signed-off-by: Matt Poduska <matt.poduska@rockwellcollins.com>
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---

Applied to master, thanks. Could you send the patch to the upstream
project at https://sourceforge.net/projects/iperf2/. Note: this is a
different upstream than the one you submitted the patch. The one to
which you submitted the patch seems to no longer be active. iperf2 is
active, and has made a release in June 2016.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
