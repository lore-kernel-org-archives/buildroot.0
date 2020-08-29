From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Aug 2020 13:36:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: add
 security fix for CVE-2020-14347
References: <20200810064109.447089-1-bernd.kuhls@t-online.de>
 <20200811234906.051e8caa@windsurf.home>
 <ovpn1hxmln.ln2@ID-313208.user.individual.net>
 <878sdymwsk.fsf@dell.be.48ers.dk>
Message-ID: <27rp1hxg4f.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am Fri, 28 Aug 2020 20:48:27 +0200 schrieb Peter Korsgaard:

> They were added to support various binary X11 video drivers,
> E.G. nvidia-tegra23 for 1.14.x and amd-catalyst for 1.19.x. Given that
> none of them have seen any real updates for ~5 years, I am fine with
> removing those packages and the older xserver versions.
> 
> Care to send patches for this?

done: http://patchwork.ozlabs.org/project/buildroot/list/?series=198371

I have no idea and no time to investigate if there are alternative 
drivers available so I just removed the catalyst & tegra23 drivers.

Regards, Bernd
