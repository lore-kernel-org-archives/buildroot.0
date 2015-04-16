From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 07:59:54 +0200
Subject: [Buildroot] [PATCH] gcc: disable libsanitizer for sparc
In-Reply-To: <1429126916-21809-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429126916-21809-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150416075954.46c72e4d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 15 Apr 2015 16:41:56 -0300, Gustavo Zacarias wrote:
> Normally libsanitizer handles the different functionalities gracefully for
> each architecture, but it doesn't seem to be the case for SPARC.
> Since in general it doesn't support anything for SPARC just disable it.
> 
> Fixes bug #7951.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gcc/gcc.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
