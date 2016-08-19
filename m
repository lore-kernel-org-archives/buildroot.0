From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 12:22:17 +0200
Subject: [Buildroot] [PATCH] linux-pam: uses fork() needs MMU
In-Reply-To: <20160818062345.GA28431@waldemar-brodkorb.de>
References: <20160818062345.GA28431@waldemar-brodkorb.de>
Message-ID: <20160819122217.509f3865@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 08:23:45 +0200, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/8c9/8c9a5fe52f762b4ff4444cf41efdf0d3cf203986/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/linux-pam/Config.in  | 1 +
>  package/nodm/Config.in       | 1 +
>  package/python-pam/Config.in | 1 +
>  package/rsh-redone/Config.in | 2 ++
>  package/util-linux/Config.in | 2 ++
>  5 files changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
