From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:25:21 +0200
Subject: [Buildroot] [v2 1/4] package/redis: Add redis system user
In-Reply-To: <1437650429-13748-1-git-send-email-martin@barkynet.com>
References: <1437650429-13748-1-git-send-email-martin@barkynet.com>
Message-ID: <20150723232521.4031d2c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Thu, 23 Jul 2015 12:20:26 +0100, Martin Bark wrote:
> Add a redis system user and set the home directory to /var/lib/redis
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> ---
> Changes v1 -> v2
>  - Set redis user shell to /bin/false (Suggested by Thomas Petazzoni)
>  - Removed $(INSTALL) of /var/lib/redis (Suggested by Thomas Petazzoni)
> ---
>  package/redis/redis.mk | 4 ++++
>  1 file changed, 4 insertions(+)

All four patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
