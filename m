From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Tue, 31 Mar 2015 11:25:25 +0200
Subject: [Buildroot] polarssl https download cercificate error.
Message-ID: <551A6805.9050003@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

The link https://tls.mbed.org/download/polarssl-1.2.13-gpl.tgz seems to 
be OK when
opening this from a browser.
Why is the download complaining ?

 >> polarssl 1.2.13 Downloading
--2015-03-31 11:20:06-- 
https://tls.mbed.org/download/polarssl-1.2.13-gpl.tgz
Resolving tls.mbed.org... 79.170.91.36
Connecting to tls.mbed.org|79.170.91.36|:443... connected.
ERROR: certificate common name ?polarssl.org? doesn?t match requested 
host name ?tls.mbed.org?.
To connect to tls.mbed.org insecurely, use ?--no-check-certificate?.
--2015-03-31 11:20:06-- http://sources.buildroot.net/polarssl-1.2.13-gpl.tgz
Resolving sources.buildroot.net... 176.9.16.109
Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1023128 (999K) [application/x-gzip]
Saving to: 
?/home/buildroot12git2/output/build/.polarssl-1.2.13-gpl.tgz.XKCoSV/output?
........


Regards Johan
