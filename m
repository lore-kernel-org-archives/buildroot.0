From: Drew Cohan <drewcohan@gmail.com>
Date: Fri, 2 Mar 2007 17:17:43 -0500
Subject: [Buildroot] unable to retrieve dhcp-3.0.4.tar.gz?
Message-ID: <bf61e79a0703021417t69f25404g6c9df6be4f9e4cc1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

revision 17997

wget --passive-ftp -q -P /home/pkuser/buildroot/dl
ftp://ftp.isc.org/isc/dhcp/dhcp-3.0.4.tar.gz
make: *** [/home/pkuser/buildroot/dl/dhcp-3.0.4.tar.gz] Error 1

$ wget ftp.isc.org/isc/dhcp/dhcp-3.0.4.tar.gz
--17:17:02--  http://ftp.isc.org/isc/dhcp/dhcp-3.0.4.tar.gz
           => `dhcp-3.0.4.tar.gz'
Resolving ftp.isc.org... 204.152.184.110
Connecting to ftp.isc.org|204.152.184.110|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
17:17:04 ERROR 404: Not Found.

Thanks,

Drew
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070302/fe34bc85/attachment.htm 
