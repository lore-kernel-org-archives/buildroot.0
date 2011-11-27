From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Nov 2011 22:45:45 +0100
Subject: [Buildroot] [PATCH 1/2] kernel-headers: update to 3.1.3 and
	3.0.11
In-Reply-To: <1322421286-25746-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Sun, 27 Nov 2011 20:14:45 +0100")
References: <1322421286-25746-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87d3cdgrxy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>

Committed both, thanks.

 Sven> ---
 Sven>  toolchain/kernel-headers/Config.in                 |    4 +-
 Sven>  ...tall-fix-__packed-in-exported-kernel-head.patch |   46 --------------------
 Sven>  ...tall-fix-__packed-in-exported-kernel-head.patch |   46 ++++++++++++++++++++
 Sven>  3 files changed, 48 insertions(+), 48 deletions(-)
 Sven>  delete mode 100644 toolchain/kernel-headers/linux-3.0.10-headers_install-fix-__packed-in-exported-kernel-head.patch
 Sven>  create mode 100644 toolchain/kernel-headers/linux-3.0.11-headers_install-fix-__packed-in-exported-kernel-head.patch

This kind of patches are much easier to review if you enable git's
rename detection (-M). You can stick the following in your ~/.gitconfig
to always enable it:

[diff]
        renames = "copy"

-- 
Bye, Peter Korsgaard
