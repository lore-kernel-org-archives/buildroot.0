From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 23:01:14 +0200
Subject: [Buildroot] [PATCH] nginx: fix nginx.old clean-up
In-Reply-To: <1435203169-3930-1-git-send-email-danomimanchego123@gmail.com>
References: <1435203169-3930-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20150628230114.7e5d165b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Wed, 24 Jun 2015 23:32:49 -0400, Danomi Manchego wrote:
> The bin path for nginx is configured for /usr/sbin, so deleting
> the nginx.old back-up from /usr/bin never works.  Fix path, and
> also use "$(RM)" instead of "-$(RM)", as "rm -f" never fails.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/nginx/nginx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
