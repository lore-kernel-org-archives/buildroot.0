From: Yann Cardaillac <ycardaillac@sepro-group.com>
Date: Thu, 7 Nov 2019 17:09:32 +0100 (CET)
Subject: [Buildroot] [BUILDROOT][PACKAGE][open62541][OPCUA] open62541
 integration in buildroot
Message-ID: <1071650519.1148307.1573142972518.JavaMail.zimbra@sepro-group.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi community, 

We would like to offer our integration of package open62541 into buildroot. 

Open62541 is an opensource OPCUA stack, see [ https://open62541.org/ | https://open62541.org/ ] 

I've add all option that I could find based on the documentation however I'm not an open62541 developper so there will probably be some changes regarding "select", "depends on" and uncompatible options. 

Few of the options are not yet documented so I stored them under menu "open62541 undocumented/advanced build options". 

To improve we would need to have some help from open62541 devs. I will contact them in the nexts days. 

Until then please don't hesitate to give me some feedback. 

Best regards, 

	

	

Yann CARDAILLAC 
Ing?nieur d?veloppement logiciel 
SEPRO Robotique - Rue Henry Bessemer - Zone Acti-Est - CS 10084 - 85003 La Roche sur Yon Cedex (France) 

[ http://www.sepro-group.com/fr | www.sepro-group.com ] | [ https://twitter.com/seprogroup | 

                @SeproGroup
             ] 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191107/1bffeebf/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-add-open62541-package.patch
Type: text/x-patch
Size: 12048 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191107/1bffeebf/attachment.bin>
