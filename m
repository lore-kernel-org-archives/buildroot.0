From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 02 Mar 2018 20:18:17 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/ffmpeg: bump version to
 3.4.2
References: <20180212165106.18383-1-bernd.kuhls@t-online.de>
 <c1e58daa-5aa5-1974-d51f-2549c90ec5ed@smile.fr>
Message-ID: <pkkomexj37.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 02 Mar 2018 12:41:52 +0100 schrieb Romain Naour:

> Adding --disable-v4l2_m2m fix the issue but the v4l2 support must not
> be enabled in the first place if --disable-pthreads is used.

Hi Romain,

done: http://patchwork.ozlabs.org/patch/880787/

Regards, Bernd
