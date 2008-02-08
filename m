From: saurav barik <saurav.barik@gmail.com>
Date: Fri, 8 Feb 2008 12:21:24 +0530
Subject: [Buildroot] segmentation fault running kismet
Message-ID: <26b26d180802072251w7c06a39es337ee76936182b96@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi,

I am getting segmentation fault with kismet.

My setup is .
Gateworks BSP 0.7
Buildroot
Linux-2.6.21.4
kismet-2007-10-R1

I followed the following thread for integrating kismet .
    http://www.busybox.net/lists/buildroot/2007-October/006129.html
There were no issues with the build. I cross verified the kismet.conf
file and the values were proper.

**********************************************************************************************
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
Reading client manufacturer data and defaults from /home/saurav/client_manuf

Segmentation fault
***********************************************************************************************

Has anybody successfully used kismet with buildroot?
I shall be grateful if somebody could share some pointers on this issue.

Thanks & Regards,
Saurav

PS: I earlier sent same mail from my company's mail id, but since that
mail had company's disclaimer towards the end of it; therefore am
sending it again from a personal mail id. Thanks Joe for pointing that
out. Please help :-).
