From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 May 2013 00:19:59 +0200
Subject: [Buildroot] [PATCH 1/1] libcec: add the libcec for HDMI device
	Control
In-Reply-To: <20130506231529.4a7b2b57@skate> (Thomas Petazzoni's message of
 "Mon, 6 May 2013 23:15:29 +0200")
References: <1367618887-25757-1-git-send-email-spenser@gillilanding.com>
 <20130506231529.4a7b2b57@skate>
Message-ID: <87d2t34upc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE),y)
 >> +LIBCEC_CONF_OPT = --enable-rpi \
 >> +   --with-rpi-include-path=$(STAGING_DIR)/usr/include
 >> +endif

 Thomas> So the package builds and works fine without the RPi libraries, and
 Thomas> those are just adding some optional features?

It afaik enables the driver to use the cec interface on the rpi next to
the driver for the pulse-eight usb dongle.

-- 
Bye, Peter Korsgaard
