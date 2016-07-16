From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 22:51:16 +0200
Subject: [Buildroot] [v2 2/5] package/audit: add support for host variant
In-Reply-To: <1468699589-14328-2-git-send-email-Aduskett@gmail.com>
References: <1468699589-14328-1-git-send-email-Aduskett@gmail.com>
 <1468699589-14328-2-git-send-email-Aduskett@gmail.com>
Message-ID: <20160716225116.3a479c5c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jul 2016 16:06:26 -0400, Adam Duskett wrote:
> refpolicy requires host-audit to compile.  This patch adds that support.
> As previously discussed, libcap-ng is required as far as I can tell, and
> as such, I have made it mandatory to compile it as a dependency.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes:

I've applied after removing the libcap-ng usage for the moment, and
reworking the commit log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
