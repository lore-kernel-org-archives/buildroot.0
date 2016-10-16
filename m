From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 15:54:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: Use libsystemd
 instead of libsystemd-daemon
In-Reply-To: <20160924192728.4981-1-bernd.kuhls@t-online.de>
References: <20160924192728.4981-1-bernd.kuhls@t-online.de>
Message-ID: <20161016155455.3f3b2e28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Sep 2016 21:27:28 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/78a/78af581f24758f7c2b19305a801e4c6c943730fb/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/transmission/0005-libsystemd.patch | 133 +++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 package/transmission/0005-libsystemd.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
