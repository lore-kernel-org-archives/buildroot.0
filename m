From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Apr 2015 14:29:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/bsdiff: add patch to fix
 missing header for u_char
In-Reply-To: <1430395648-17870-1-git-send-email-joerg.krause@embedded.rocks>
References: <1430395648-17870-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150430142956.0f56251f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 30 Apr 2015 14:07:28 +0200, J?rg Krause wrote:
> Fixes http://autobuild.buildroot.net/results/31a/31a837cf6e34b02dce498f2b12e40d6d16a5a8e6/
> 
> Patch not sent upstream - no maintainer mail address of repository found.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/bsdiff/0001-Add-missing-header-for-u_char.patch | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 package/bsdiff/0001-Add-missing-header-for-u_char.patch
> 
> diff --git a/package/bsdiff/0001-Add-missing-header-for-u_char.patch b/package/bsdiff/0001-Add-missing-header-for-u_char.patch
> new file mode 100644
> index 0000000..9a7a837
> --- /dev/null
> +++ b/package/bsdiff/0001-Add-missing-header-for-u_char.patch

Missing description + SoB inside the patch itself.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
