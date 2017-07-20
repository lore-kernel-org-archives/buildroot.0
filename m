From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:30:30 +0200
Subject: [Buildroot] [PATCH v8 02/10] package/patchelf: add patch for
 rpath sanitization under a root directory
In-Reply-To: <1500561321-6623-3-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-3-git-send-email-wg@grandegger.com>
Message-ID: <20170720223030.2f8f126e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 16:35:13 +0200, Wolfgang Grandegger wrote:
> The patch allows to use patchelf to sanitize the rpath of the buildroot
> libraries and binaries using the option "--make-rpath-relative <rootdir>".
> Recent versions of patchelf will not built on old Debian and RHEL systems
> due to C++11 constructs. Therefore we stick with v0.9 for the time being.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ...move-apparently-incorrect-usage-of-static.patch |  56 ++++
>  ...unction-for-splitting-a-colon-separated-s.patch |  63 ++++
>  ...to-make-the-rpath-relative-under-a-specif.patch | 332 +++++++++++++++++++++
>  3 files changed, 451 insertions(+)
>  create mode 100644 package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
>  create mode 100644 package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
>  create mode 100644 package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
