From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:49:18 +0200
Subject: [Buildroot] [PATCH] supervisor: security bump to version 3.1.4
In-Reply-To: <20170907094459.10277-1-peter@korsgaard.com>
References: <20170907094459.10277-1-peter@korsgaard.com>
Message-ID: <20170909224918.18b7d1d4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Sep 2017 11:44:59 +0200, Peter Korsgaard wrote:
> Fixes CVE-2017-11610 - The XML-RPC server in supervisor before 3.0.1, 3.1.x
> before 3.1.4, 3.2.x before 3.2.4, and 3.3.x before 3.3.3 allows remote
> authenticated users to execute arbitrary commands via a crafted XML-RPC
> request, related to nested supervisord namespace lookups.
> 
> For more details, see
> https://github.com/Supervisor/supervisor/issues/964
> 
> While we're at it, add hashes for the license files.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/supervisor/supervisor.hash | 4 +++-
>  package/supervisor/supervisor.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
