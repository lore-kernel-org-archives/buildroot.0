From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Nov 2019 21:56:42 +0100
Subject: [Buildroot] [PATCH] package/libfribidi: add upstream security
 fix
In-Reply-To: <20191108160030.12803-1-peter@korsgaard.com>
References: <20191108160030.12803-1-peter@korsgaard.com>
Message-ID: <20191108215642.025b8d59@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Nov 2019 17:00:29 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issue:
> 
> - CVE-2019-18397: GNU FriBidi stack buffer overflow >= 1.0.0
> 
> For more details, see the advisory:
> https://www.openwall.com/lists/oss-security/2019/11/08/5
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ..._level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libfribidi/0001-Truncate-isolate_level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
