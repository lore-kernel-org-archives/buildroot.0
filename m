From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 18 Jun 2017 21:41:58 +0300
Subject: [Buildroot]  [PATCH 0/2] Add xradio wireless driver
Message-ID: <20170618184200.31167-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This small series adds xradio wireless driver for XR819 SDIO chip
and includes this driver to orange-pi-zero board images.

Note that this series does not include firmware since I have certain doubts
regarding firmware packaging. IIUC normally xr819 firmware is extracted
from vendor's SDK. Extracted firmware can be obtained from various places
on the web, e.g. from Armbian project.

Would it be alright to point at Armbian github in firmware package ?

Regards,
Sergey
