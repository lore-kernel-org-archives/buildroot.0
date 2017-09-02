From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 02 Sep 2017 19:32:10 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/fontconfig: bump version
	to 2.12.4
References: <20170806073155.18409-1-bernd.kuhls@t-online.de>
 <20170902190628.462af963@windsurf.lan>
Message-ID: <qh6r7exsoc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 02 Sep 2017 19:06:28 +0200 schrieb Thomas Petazzoni:

> This commit broke the build, because the host-gperf dependency is still
> necessary. I hadn't noticed it used to be there, so I simply reverted.

I did not notice either because my host has gperf installed :(

> I think it's weird for fontconfig to need host-gperf, as it already
> ships the generated files: but the dependencies in the Makefile.am look
> bogus to me.

Yes, but upstream already acted upon this and removed the generated file 
from the tarball: https://cgit.freedesktop.org/fontconfig/commit/?
id=651f1227646174b5be0186b4b6cdff3a7134d869

> So, can we have a bump to 2.12.4 that keeps the host-gperf dependency,

Sent http://patchwork.ozlabs.org/patch/809129/

Regards, Bernd
