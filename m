From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 17:58:11 +0100
Subject: [Buildroot] [PATCH] lzma: repair build
In-Reply-To: <1417640549-589-1-git-send-email-vincent.stehle@laposte.net>
References: <1417640549-589-1-git-send-email-vincent.stehle@laposte.net>
Message-ID: <20150110175811.561f995e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Wed,  3 Dec 2014 22:02:29 +0100, Vincent Stehl? wrote:
> The build of host-lzma is broken since commit 97703978ac870ce2
> ("support/libtool: make -static behave like -all-static").
> 
> Lzma forces '-static' in its LDFLAGS, which contradicts what buildroot tries to
> achieve by patching libtool scripts and configuring host packages with
> '--disable-static'.
> 
> We add a patch to remove lzma's hardcoded LDFLAGS, to fix the build.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../lzma-0001-Remove-static-from-LDFLAGS.patch     | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 package/lzma/lzma-0001-Remove-static-from-LDFLAGS.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
