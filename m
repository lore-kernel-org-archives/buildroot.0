From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jun 2018 22:12:34 +0200
Subject: [Buildroot] [PATCH 2/2] package/speex: bump version to 1.2.0
References: <20180610101024.5035-1-bernd.kuhls@t-online.de>
 <20180610101024.5035-2-bernd.kuhls@t-online.de>
Message-ID: <iad0vexgtp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 10 Jun 2018 12:10:24 +0200 schrieb Bernd Kuhls:

> Added upstream md5 & locally computed license hashes, rebased patch,
> updated SPEEX_SITE.

Hi,

this commit broke freeswitch and asterisk due to the split of the DSP 
library into its own package speexdsp, sent new series to fix the problem:

http://patchwork.ozlabs.org/patch/927405/
http://patchwork.ozlabs.org/patch/927407/
http://patchwork.ozlabs.org/patch/927404/
http://patchwork.ozlabs.org/patch/927406/

Regards, Bernd

PS: patchworks did not recognize the patches as a series.
