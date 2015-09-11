From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 19:46:32 +0200
Subject: [Buildroot] [PATCH] util-linux: bump version to 2.27
In-Reply-To: <1441977987-43640-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441977987-43640-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150911194632.67ddf349@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Fri, 11 Sep 2015 14:26:27 +0100, Vicente Olivert Riera wrote:
> Removed 0002-program-invocation-short-name.patch since the changes it
> does are now upstream:
> 
>   https://kernel.googlesource.com/pub/scm/utils/util-linux/util-linux/+/37edac9a0ca83f311279d2e49bacd6ac80310dc8
> 
> This release includes a security fix:
> 
> CVE-2015-5224 - chfn, chsh file name collision due to incorrect mkstemp
> use if compiled without libuser.
> [thanks to Qualys Security Advisory team; qualys.com]
> 
> Release notes here:
> 
>   https://www.kernel.org/pub/linux/utils/util-linux/v2.27/v2.27-ReleaseNotes
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Speaking of util-linux, it would be good if we could make progress on
the following patches:

  http://patchwork.ozlabs.org/patch/494867/
  http://patchwork.ozlabs.org/patch/494866/
  http://patchwork.ozlabs.org/patch/494868/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
