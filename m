From: Jedrzej Panek <jpanek@stephan-gmbh.com>
Date: Wed, 1 Aug 2018 16:19:55 +0000
Subject: [Buildroot] Build not bootable when build with Ubuntu 18.04
Message-ID: <1533140393945.36133@stephan-gmbh.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

when I build my custom Linux on Ubuntu 16.04 and dd it on my cf-card, my device boots fine.
Once I changed to Ubuntu 18.04 and did a full rebuild my embedded device cannot boot anymore (disk boot failure).
I get no errors during the building process itself, and my desktop recognizes the card just fine. Did anyone experience similar issues?
For me, it seems that the bootloader is failing.

Thank you

Mit freundlichen Gr??en / Best regards




Jedrzej Panek






[cid:LogoFritzStephan72dpi120x55Pixel_cfdd7a92-cbea-435d-a419-8d088e6ed7a8.png]


Fritz Stephan GmbH


-  Medizintechnik -


Kirchstra?e 19, D-56412 Gackenbach





Tel.: +49 6439 9125-0


Fax: +49 6439 9125-111



E-Mail: jpanek at stephan-gmbh.com<mailto:jpanek@stephan-gmbh.com>


Web: www.stephan-gmbh.com





Handelsregister Amtsgericht Montabaur HR-Nr. 4241


Gesch?ftsf?hrer: Rainer Hafermann, Bernd H?hne





[cid:Eve_Signatur_145525f8-5839-48a6-8419-4e43941739b5.jpg] [cid:YouTube-logo-full_color_362f623d-4265-4133-9721-da6b905f4c25.png] <https://www.youtube.com/channel/UCtILKk6D8klJo5FwlycY82w>


Weitere Informationen zum Datenschutz erhalten Sie unter http://www.stephan-gmbh.com/Datenschutz<http://www.stephan-gmbh.com/download.php?f=56f80b747dcae3eb620939d6213d6e05>.


Please find the data protection guidelines on http://www.stephan-gmbh.com/Datenschutz<http://www.stephan-gmbh.com/download.php?f=56f80b747dcae3eb620939d6213d6e05>.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180801/284cb3d2/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: LogoFritzStephan72dpi120x55Pixel_cfdd7a92-cbea-435d-a419-8d088e6ed7a8.png
Type: image/png
Size: 7124 bytes
Desc: LogoFritzStephan72dpi120x55Pixel_cfdd7a92-cbea-435d-a419-8d088e6ed7a8.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180801/284cb3d2/attachment.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Eve_Signatur_145525f8-5839-48a6-8419-4e43941739b5.jpg
Type: image/jpeg
Size: 3774 bytes
Desc: Eve_Signatur_145525f8-5839-48a6-8419-4e43941739b5.jpg
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180801/284cb3d2/attachment.jpg>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: YouTube-logo-full_color_362f623d-4265-4133-9721-da6b905f4c25.png
Type: image/png
Size: 5658 bytes
Desc: YouTube-logo-full_color_362f623d-4265-4133-9721-da6b905f4c25.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180801/284cb3d2/attachment-0001.png>
