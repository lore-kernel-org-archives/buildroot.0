From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:18:05 +0200
Subject: [Buildroot] [PATCH] libglib2: fix compilation for aarch64 and
 arc
In-Reply-To: <1397141196-1316-1-git-send-email-abrodkin@synopsys.com>
References: <1397141196-1316-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140417221805.30a13a25@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Thu, 10 Apr 2014 18:46:36 +0400, Alexey Brodkin wrote:
> Copied from here - https://github.com/openembedded/oe-core/blob/master/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
> 
> Initially posted here - http://lists.openembedded.org/pipermail/openembedded-core/2013-October/085174.html
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  ...ror-format-string-errors-from-mismatched-.patch | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
