From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 May 2017 09:45:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/dhcp: create tmpfiles.d
	directory
References: <20170526221348.19078-1-romain.naour@gmail.com>
Message-ID: <ndnnvdxale.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 27 May 2017 00:13:47 +0200 schrieb Romain Naour:

> dhcp.mk try to create dhcp.conf in a non-existant directory.
> 
> Fixes:
> http://autobuild.buildroot.net/
results/40e/40e48f74b586ce380766cf31473932e43090671e
> 
> Signed-off-by: Romain Naour
> <romain.naour@gmail.com> ---
>  package/dhcp/dhcp.mk | 1 +
>  1 file changed, 1 insertion(+)

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile tested)
