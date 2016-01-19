From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:59:07 +0100
Subject: [Buildroot] [PATCH] linux: handle read-only dts files
In-Reply-To: <1439338309-19690-1-git-send-email-hollis_blanchard@mentor.com>
References: <1439338309-19690-1-git-send-email-hollis_blanchard@mentor.com>
Message-ID: <20160119215907.31e78f9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hollis Blanchard,

On Tue, 11 Aug 2015 17:11:49 -0700, Hollis Blanchard wrote:
> Some fine version control systems make all files read-only. The custom DTS file
> may therefore be read-only, and that permission is preserved when copying into
> the Linux build directory. A subsequent rebuild tries to 'cp' again, which
> fails with a "Permission denied" error unless the -f option is used.
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
