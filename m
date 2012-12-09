From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 10 Dec 2012 00:43:44 +0100
Subject: [Buildroot] libusb confusion
Message-ID: <5A92242ABF2043D2B2CBFF8686E130BE@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi
 
There seem to be more libusb's ....
 
http://sourceforge.net/projects/libusb/files/

Claims the latest version is  0.1.4 (buildroot libusb-compat) 

#############################################################
#
# libusb-compat
#
#############################################################
LIBUSB_COMPAT_VERSION = 0.1.4
LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)



And then we also have in buildroot libusb 1.0.9
#############################################################
#
# libusb
#
#############################################################
LIBUSB_VERSION = 1.0.9
LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
LIBUSB_SITE = http://downloads.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)





But there is also : http://libusb.sourceforge.net/download.html

http://prdownloads.sourceforge.net/libusb/libusb-0.1.12.tar.gz

I think usb_modeswitch needs this one.



Sagaert Johan
