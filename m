From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 1 Mar 2017 17:28:09 +0100
Subject: [Buildroot] [PATCH 3/5] telit_evk_pro3_defconfig: remove broken
	defconfig
In-Reply-To: <20170301083046.13226-3-arnout@mind.be>
References: <20170301083046.13226-1-arnout@mind.be>
 <20170301083046.13226-3-arnout@mind.be>
Message-ID: <CAHkwnC_M3=cTtes4_Qc3Jig2+Q7=eJ=A4WoNsRFomLWuwJ_kKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-03-01 9:30 GMT+01:00 Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be>:
> This defconfig has been broken due to gcc5 for more than half a year,
> and nobody stepped up to fix it. Remove it, as well as it board
> directory.

Hi Arnout,
sorry for the late response, today I've sent a patch to fix the build
failure for barebox, tomorrow i will send a patch to update the linux
kernel.

Thanks
--
Fabio Porcedda
