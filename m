From: Malte Starostik <lists@malte.homeip.net>
Date: Fri, 14 Oct 2011 17:12:49 +0200
Subject: [Buildroot] [PATCH] New package: xinput-calibrator
In-Reply-To: <4E984FEA.6010003@visionsystems.de>
References: <4E984F1D.6060103@visionsystems.de>
 <4E984FEA.6010003@visionsystems.de>
Message-ID: <201110141712.50092.lists@malte.homeip.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Freitag, 14. Oktober 2011, 17:06:18 schrieb Yegor Yefremov:
> > +XAPP_XINPUT_CALIBRATOR_SITE =
> > http://github.com/downloads/tias/xinput_calibrator
> 
> this package has one little problem:
> 
> wget complains over certificate so I can only download it via wget
> --no-check-certificate
> http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-0.7.5
> .tar.gz
> 
> Any idea?

What error do you get?  Maybe it's just your OpenSSL/CA-Certificates config?  
Validates fine here:
Gentoo Linux on x86_64
wget 1.12
openssl 1.0.0e
ca-certificates 20110502

and according to firefox 7.0.1 it's also good.

Regards,
Malte
