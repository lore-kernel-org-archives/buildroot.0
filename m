From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 19:54:34 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/mysql: add MYSQL_SOCKET
 variable
In-Reply-To: <1473804231-9767-1-git-send-email-bos@je-eigen-domein.nl>
References: <1473804231-9767-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20160918195434.49f3beb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Sep 2016 00:03:50 +0200, Floris Bos wrote:
> Add MYSQL_SOCKET variable with MySQL socket location
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> 
> ---
> Changes v2 -> v3:
> - fix systemd unit file missing User

Both patches applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
