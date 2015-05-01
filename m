From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 10:03:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/bsdiff: add patch to fix
 missing header for u_char
In-Reply-To: <1430418775-19094-1-git-send-email-joerg.krause@embedded.rocks>
References: <1430418775-19094-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150501100353.09dd1853@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 30 Apr 2015 20:32:55 +0200, J?rg Krause wrote:
> Fix missing header <sys/types.h> for u_char in bspatch.c.
> 
> Fixes http://autobuild.buildroot.net/results/31a/31a837cf6e34b02dce498f2b12e40d6d16a5a8e6/
> 
> Patch not sent upstream - no maintainer mail address or repository found.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v1 -> v2:
>   - Add description and Sob to patch file
> ---
>  package/bsdiff/0001-Add-missing-header-for-u_char.patch | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 package/bsdiff/0001-Add-missing-header-for-u_char.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
