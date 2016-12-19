From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Dec 2016 22:26:56 +0100
Subject: [Buildroot] [PATCH] package/google-breakpad: add C++11
 dependency on the host variant
In-Reply-To: <1482179125-11704-1-git-send-email-romain.naour@gmail.com>
References: <1482179125-11704-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161219222656.64b1e5f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Dec 2016 21:25:25 +0100, Romain Naour wrote:
> When google-breakpad has been updated to the latest version, the C++11
> dependency has been added for the target variant only.
> The C++11 dependency is also required for the host variant.
> 
> Fixes:
> http://autobuild.buildroot.org/results/dce/dcecb17116c0cf400c98f0052c9bf71f15d0d398
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  Config.in                         | 1 +
>  package/google-breakpad/Config.in | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
