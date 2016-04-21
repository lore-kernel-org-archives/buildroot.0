From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 23:05:14 +0200
Subject: [Buildroot] [PATCH v2 1/2] buildroot-test: enable toolchains
 based on hostarch
In-Reply-To: <1459468972-31420-1-git-send-email-matt@thewebers.ws>
References: <1459468972-31420-1-git-send-email-matt@thewebers.ws>
Message-ID: <20160421230514.7cf6e91e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Mar 2016 19:02:51 -0500, Matt Weber wrote:
> - updated toolchain csv to include hostarch
> - fixed logic in autobuild-run to correctly select any, x86_64 vs x86
> 
> Signed-off-by: Matt Weber <matt@thewebers.ws>
> 
> --
> Changes for v2
> - Updated toolchain csv file to have internal configs
>   listed as any type (Suggested by Thomas)
> - Updated autobuild-run script to account for 'any' hostarch
>   type as well as x86_64 being capable of running x86 toolchains
>   (Sgggested by Thomas)
> ---
>  scripts/autobuild-run                        | 25 +++++++++++--
>  web/toolchains/configs/toolchain-configs.csv | 56 ++++++++++++++--------------
>  2 files changed, 49 insertions(+), 32 deletions(-)

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
