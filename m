From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Aug 2017 18:33:37 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-08-24
References: <20170825063055.051A620998@mail.free-electrons.com>
Message-ID: <1gk87ex70o.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 25 Aug 2017 08:30:55 +0200 schrieb Thomas Petazzoni:

>          arm |                   ffmpeg-3.3.3 | NOK |
>          http://autobuild.buildroot.net/
results/5444b0c5556a42923e3fcdae782811a805e51b1f

Hi,

this build error is fixed by http://patchwork.ozlabs.org/patch/780432/

Alternatively we can bump opencv to 2.4.13.3, it also fixes the build 
error and we can remove patches 0002 & 0003.

Regards, Bernd
