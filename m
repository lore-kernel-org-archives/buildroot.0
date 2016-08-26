From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 11:09:34 +0200
Subject: [Buildroot] [PATCH] boa: boa.conf: run under the nogroup group
In-Reply-To: <1472162021-3722-1-git-send-email-peter@korsgaard.com>
References: <1472162021-3722-1-git-send-email-peter@korsgaard.com>
Message-ID: <20160826110934.769002a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 23:53:41 +0200, Peter Korsgaard wrote:
> The default boa.conf we install specifies that boa should run under the
> nobody group, but we don't have such a group in our default skeleton (and
> boa doesn't add it), causing boa to fail to start:
> 
> [01/Jan/1970:00:00:10 +0000] No such group: nobody
> 
> Instead use the nogroup group, which is presumably what was meant.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/boa/boa.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
