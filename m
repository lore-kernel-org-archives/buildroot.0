From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:26:44 +1300
Subject: [Buildroot] [1/5] checkpolicy: bump version to 2.6
In-Reply-To: <20170109161523.6855-1-aduskett@codeblue.com>
References: <20170109161523.6855-1-aduskett@codeblue.com>
Message-ID: <20170125232644.1d46cf06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Jan 2017 11:15:19 -0500, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  package/checkpolicy/checkpolicy.hash | 2 +-
>  package/checkpolicy/checkpolicy.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

I've applied all 5 patches, after adding a libselinux patch to fix the
build failure with old compilers. This patch has been submitted
upstream to the SELinux developers.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
