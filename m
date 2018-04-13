From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Apr 2018 10:13:41 +0200
Subject: [Buildroot] [PATCH 1/1] tcf-agent: bump to version 1.7.0
In-Reply-To: <20180412151310.15252-1-eugene@largest.net>
References: <20180412151310.15252-1-eugene@largest.net>
Message-ID: <20180413101341.52d0031e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 08:13:10 -0700, Eugene Tarassov wrote:
> Build issues with MicroBlaze and PPC64 targets are fixed
> 
> Signed-off-by: Eugene Tarassov <eugene@largest.net>
> ---
>  ...gent-add-install-target-to-the-CMakeLists.patch |  48 ----------
>  ...-remove-explicit-uses-of-__ptrace_request.patch | 103 ---------------------
>  ...de-canonicalize_file_name-for-all-c-libs-.patch |  46 ---------
>  package/tcf-agent/Config.in                        |   5 +-
>  package/tcf-agent/tcf-agent.hash                   |   2 +-
>  package/tcf-agent/tcf-agent.mk                     |   2 +-
>  6 files changed, 4 insertions(+), 202 deletions(-)
>  delete mode 100644 package/tcf-agent/0001-agent-add-install-target-to-the-CMakeLists.patch
>  delete mode 100644 package/tcf-agent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
>  delete mode 100644 package/tcf-agent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch

Applied to master, thanks.

Please send follow-up patches to further improve things if needed.
Moving from CMake to plain Makefiles is not really considered an
improvement, unless it's the decision from upstream to move away from
CMake.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
