From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 11:55:47 +0100
Subject: [Buildroot] [PATCH] haveged: fix systemd service path
In-Reply-To: <1446626197-25693-1-git-send-email-steven@uplinklabs.net>
References: <1446626197-25693-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20151104115547.4b111036@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Wed,  4 Nov 2015 00:36:37 -0800, Steven Noonan wrote:
> 'haveged' is installed in /usr/sbin, not /usr/bin.
> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  package/haveged/haveged.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
