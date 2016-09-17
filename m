From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 12:38:02 +0200
Subject: [Buildroot] [PATCH 1/2] blktrace: add dependency on NPTL
In-Reply-To: <1474052327-16663-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1474052327-16663-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160917123802.24899fbe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 00:28:46 +0530, Rahul Bedarkar wrote:
> blkiomon.c assumes that clock_nanosleep() is always available. But it
> is only available with NPTL. Since it unconditionally uses it, we add
> dependency on NPTL.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/c87/c87cd4a7b0bed938506bcf7e88d4cda60e28e6e5/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/blktrace/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
