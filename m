From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 14 Oct 2011 17:06:18 +0200
Subject: [Buildroot] [PATCH] New package: xinput-calibrator
In-Reply-To: <4E984F1D.6060103@visionsystems.de>
References: <4E984F1D.6060103@visionsystems.de>
Message-ID: <4E984FEA.6010003@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> +XAPP_XINPUT_CALIBRATOR_SITE = http://github.com/downloads/tias/xinput_calibrator

this package has one little problem:

wget complains over certificate so I can only download it via wget --no-check-certificate http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-0.7.5.tar.gz

Any idea?

Yegor
