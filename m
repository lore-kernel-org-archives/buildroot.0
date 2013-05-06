From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 6 May 2013 17:51:00 -0500
Subject: [Buildroot] [PATCH 1/1] libcec: add the libcec for HDMI device
	Control
In-Reply-To: <87d2t34upc.fsf@dell.be.48ers.dk>
References: <1367618887-25757-1-git-send-email-spenser@gillilanding.com>
 <20130506231529.4a7b2b57@skate> <87d2t34upc.fsf@dell.be.48ers.dk>
Message-ID: <CAEBucnD2WAXSOUD9fs7Qvk7_wpzJ7MBBxLQ+Rqt9nccToFNcTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 6, 2013 at 5:19 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> Hi,
>
>  >> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE),y)
>  >> +LIBCEC_CONF_OPT = --enable-rpi \
>  >> +   --with-rpi-include-path=$(STAGING_DIR)/usr/include
>  >> +endif
>
>  Thomas> So the package builds and works fine without the RPi libraries, and
>  Thomas> those are just adding some optional features?
>
> It afaik enables the driver to use the cec interface on the rpi next to
> the driver for the pulse-eight usb dongle.

Thomas: Peter's explanation is correct.
Thomas: I am addressing the above issues in a new patch.

Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
