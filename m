From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Aug 2011 10:45:16 +0200
Subject: [Buildroot] [PATCH] mdev: Add auto-mounting support for USB and
	SD card
In-Reply-To: <28cd2ef34f796e8e58e96bd6a8dd681b@zacarias.com.ar> (Gustavo
 Zacarias's message of "Sat, 27 Aug 2011 10:13:38 -0300")
References: <1314419182-21753-1-git-send-email-plagnioj@jcrosoft.com>
 <28cd2ef34f796e8e58e96bd6a8dd681b@zacarias.com.ar>
Message-ID: <87fwklq603.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On Sat, 27 Aug 2011 06:26:22 +0200, Jean-Christophe PLAGNIOL-VILLARD
 Gustavo> wrote:

 >> this will mount the device in /media as
 >> /media/${MDEV}

 Gustavo> I'd make it an option, there are many scenarios where you don't want
 Gustavo> devices automounting media.
 Gustavo> Regards.

Agreed, something like the usbmount package we have for udev.

-- 
Bye, Peter Korsgaard
