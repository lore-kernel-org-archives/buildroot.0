From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 12 Jan 2014 13:00:32 +0100
Subject: [Buildroot] [PATCH 0/6] xorg: Finally bump xserver_xorg-server
	version to 1.15.0
References: <BLU0-SMTP30016302819EB8819E5610D9B20@phx.gbl>
Message-ID: <0ocaqaxl87.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <berndkuhls@hotmail.com> wrote in
news:BLU0-SMTP30016302819EB8819E5610D9B20 at phx.gbl: 

> These patches depend on each other to bump xserver_xorg-server to
> 1.15.0: 
> 
> - mesa3d requires libdrm >= 2.4.49 when the intel driver is selected
> - xorg requires mesa3d >= 9.2.0
> 
> This patch series supersedes the previous versions of the corresponding
> patches, patchworks was also updated to reflect this.

Hi,

I created a bundle on patchwork for easier testing:

http://patchwork.ozlabs.org/bundle/bkuhls/xorg/mbox/

Regards, Bernd
