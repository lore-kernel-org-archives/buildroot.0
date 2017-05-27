From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:18:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/dhcp: create tmpfiles.d
 directory
In-Reply-To: <20170526221348.19078-1-romain.naour@gmail.com>
References: <20170526221348.19078-1-romain.naour@gmail.com>
Message-ID: <20170527171838.7397db12@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 May 2017 00:13:47 +0200, Romain Naour wrote:
> dhcp.mk try to create dhcp.conf in a non-existant directory.
> 
> Fixes:
> http://autobuild.buildroot.net/results/40e/40e48f74b586ce380766cf31473932e43090671e
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/dhcp/dhcp.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
