From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 20:58:58 +0100
Subject: [Buildroot] [PATCH] vorbis-tools: add fix for CVE-2015-6749
In-Reply-To: <1445994245-17963-1-git-send-email-gustavo@zacarias.com.ar>
References: <1445994245-17963-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151102205858.136809a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 27 Oct 2015 22:04:05 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-6749 - invalid AIFF file causes alloca() buffer overflow.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...oggenc-Fix-large-alloca-on-bad-AIFF-input.patch | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
