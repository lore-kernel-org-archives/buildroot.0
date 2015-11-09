From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 09 Nov 2015 06:53:51 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-11-06
References: <20151107073016.DCC83100931@stock.ovh.net>
Message-ID: <f0p5hcxm2q.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 07 Nov 2015 08:30:16 +0100 schrieb Thomas Petazzoni:

>          arm |                   gauche-0.9.4 | NOK |
>          http://autobuild.buildroot.net/
results/43abe584b53995097d81e8e75a900fd9f09e1961/

Hi,

I could not reproduce the build error but I think this upstream commit 
should fix it: https://github.com/shirok/Gauche/
commit/625ca6201271e68aac53dbd532d3f17fecd9c4cb

Regards, Bernd
