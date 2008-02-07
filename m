From: Saurav Kumar Barik <sauravb@aztecsoft.com>
Date: Thu, 7 Feb 2008 22:01:58 +0530
Subject: [Buildroot] segmentation fault running kismet
Message-ID: <A1286843C9B74E46B0063D92B7844C2802DE7E8A@azindbaex01.aztec.soft>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,



I am getting segmentation fault with kismet.

My setup is -

Gateworks BSP 0.7

Buildroot

Linux-2.6.21.4

kismet-2007-10-R1



I followed the following thread for integrating kismet -

*	http://www.busybox.net/lists/buildroot/2007-October/006129.html

There were no issues with the build. I cross verified the kismet.conf
file and the values were proper.



************************************************************************
**********************

[root at saurav]# ./kismet_server -f kismet.conf

Using alternate config file: kismet.conf

Will drop privs to saurav (1001) gid 1001

No specific sources given to be enabled, all will be enabled.

Enabling channel hopping.

Enabling channel splitting.

Dropped privs to saurav (1001) gid 1001

WARNING:  Disabling GPS logging.

Logging networks to Kismet.network

Logging networks in CSV format to Kismet.csv

Logging networks in XML format to Kismet.xml

Logging cryptographically weak packets to Kismet.weak

Logging cisco product information to Kismet.cisco

Tracking probe responses and associating probe networks.

Reading AP manufacturer data and defaults from /home/saurav/ap_manuf

Reading client manufacturer data and defaults from
/home/saurav/client_manuf

Segmentation fault

************************************************************************
***********************



Has anybody successfully used kismet with buildroot?

I shall be grateful if somebody could share some pointers on this issue.



Thanks & Regards,

Saurav





This email message and its attachments may contain CONFIDENTIAL AND PRIVILEGED INFORMATION intended for the sole use of the addressee(s). If you have received it in error, please contact the sender by return email, notify your system manager and destroy the original message and any copies thereof. Any review, use, disclosure or distribution is unlawful. Please check this email and any attachments for the presence of viruses. The Company accepts no  liability for any damage caused by any virus transmitted by this email. The views or opinions presented in this e-mail are solely those of the author and do not necessarily represent those of the company.
The Company reserves the right to monitor, review and store the content of all messages sent to or from this e-mail address.

www.aztecsoft.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080207/949208dd/attachment.htm 
