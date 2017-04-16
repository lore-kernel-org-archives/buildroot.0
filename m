From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 17:11:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: disable cuda support
In-Reply-To: <20170416121236.24706-1-bernd.kuhls@t-online.de>
References: <20170416121236.24706-1-bernd.kuhls@t-online.de>
Message-ID: <20170416171125.420c303b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Apr 2017 14:12:36 +0200, Bernd Kuhls wrote:
> mpv wrongly detects cuda being available:
> 
> Checking for CUDA hwaccel : yes
> 
> leading to build errors.
> 
> Fixes
> http://autobuild.buildroot.net/results/e89/e892a537265ad7259024403a0bb3ca5da85ed096/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mpv/mpv.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
