From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed, 24 Apr 2019 22:32:07 +0200
Subject: [Buildroot] [PATCH 1/1] configs/warp7: bump to Linux 5.0 and
 U-Boot 2019.01
In-Reply-To: <CAOMZO5B7fCZ9CHQ-3A77f6kO3WDYCzxYE_Wpyd3ZHJzgBnLEPA@mail.gmail.com>
References: <1556135702-9627-1-git-send-email-pjtexier@koncepto.io>
 <CAOMZO5B7fCZ9CHQ-3A77f6kO3WDYCzxYE_Wpyd3ZHJzgBnLEPA@mail.gmail.com>
Message-ID: <91fb88e9-0961-1f73-908d-3b18ed36103b@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio,

Le 24/04/2019 ? 22:01, Fabio Estevam a ?crit?:
> We are at 5.0.9 and 2019.04 now.
>
> Could you please try these versions?
>
> Thanks


I think we can not bump to 2019.04 due to [1], maybe we can prefer the 
2019.01 for now ?

Otherwise, the WaRP7 boot nicely with 5.0.9 :

Starting kernel ...

[??? 0.000000] Booting Linux on physical CPU 0x0
[??? 0.000000] Linux version 5.0.9

...


[1] http://patchwork.ozlabs.org/patch/1084912/

-- 

Signature
<https://koncepto.io> 	

*Pierre-Jean Texier*
Co-founder and Embedded Linux expert 
<https://www.linkedin.com/in/pjtexier-embeedlinux/>

pjtexier at koncepto.io <mailto:pjtexier@koncepto.io>
+33 6 27 47 58 58

*Koncepto* <https://koncepto.io> *- We develop your embedded ideas*

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190424/7869179b/attachment.html>
