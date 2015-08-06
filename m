From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:57:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/imlib2: fix musl compilation
 issue
In-Reply-To: <1438602662-17214-1-git-send-email-brendanheading@gmail.com>
References: <1438602662-17214-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150806085756.504e18aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Mon,  3 Aug 2015 12:51:02 +0100, Brendan Heading wrote:
> Fixes http://autobuild.buildroot.net/results/a6e/a6e61bfb376946b479085f243601d6e1634adc6d/
> 
> musl is strict about including time.h when using time_t.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
>  .../0007-fix-compilation-issues-with-musl.patch    | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/imlib2/0007-fix-compilation-issues-with-musl.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
