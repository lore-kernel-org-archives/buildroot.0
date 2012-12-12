From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Dec 2012 20:44:04 +0100
Subject: [Buildroot] usb_modeswitch and lsusb yield Segmentation fault
In-Reply-To: <7EE27C3F912F450282DD2DE63A6A7FED@JohanW7> (Sagaert Johan's
 message of "Wed, 12 Dec 2012 16:26:46 +0100")
References: <BCF3711885AE41AB966E9545FDB3C8D6@JohanW7>
 <50C54E15.1030008@zacarias.com.ar>
 <97E0CBC5EB794A11A2835644E2E3CC1D@JohanW7>
 <50C5C08D.407@zacarias.com.ar>
 <7EE27C3F912F450282DD2DE63A6A7FED@JohanW7>
Message-ID: <87vcc7m4xn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi

 Sagaert> I was using the newer pthreads implementation,
 Sagaert> The old/stable pthreads are working for both lsusb (usbutils) and for usb_modeswitch with uClibc 0.9.33
 Sagaert> I did not try NTPL since this breaks the build of GDB.

Really? I don't recall any issues with GDB and NTPL? Could you provide
more details, please?

-- 
Bye, Peter Korsgaard
