From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Jun 2017 06:19:00 +0200
Subject: [Buildroot] [PATCH v2] pulseaudio: bump version to 10.0
References: <20170626222558.20574-1-ps.report@gmx.net>
Message-ID: <ku292ex3r1.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 27 Jun 2017 00:25:58 +0200 schrieb Peter Seiderer:

> ToDo/FollowUp: pulseaudio uses now a built-in json parser (see [2]),
> drop the json-c (and maybe the BR2_TOOLCHAIN_HAS_SYNC_4) dependency.

Hi Peter,

in http://patchwork.ozlabs.org/patch/718184/ I tried that but the 
configure logic of pulseaudio seems not to be an easy one. Can you help 
here?

Regards, Bernd
