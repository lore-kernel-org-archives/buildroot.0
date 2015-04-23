From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 22:59:24 +0200
Subject: [Buildroot] [PATCH] libcurl: disable curldebug
In-Reply-To: <1429819296-8647-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429819296-8647-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150423225924.15803427@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 23 Apr 2015 17:01:36 -0300, Gustavo Zacarias wrote:
> curldebug is a more advanced form of debugging for curl which audits
> source code with the checksource.pl tool, and treats warnings as errors.
> Normally users won't want/need this so disable it since it leads to
> failed builds when debug info is enabled (which is what people normally
> want).
> When buildroot does --enable-debug curl inherently enables curldebug too.
> 
> Solves bug #8041.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libcurl/libcurl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
