From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Dec 2012 12:29:18 -0300
Subject: [Buildroot] usb_modeswitch and lsusb yield Segmentation fault
In-Reply-To: <7EE27C3F912F450282DD2DE63A6A7FED@JohanW7>
References: <BCF3711885AE41AB966E9545FDB3C8D6@JohanW7>
 <50C54E15.1030008@zacarias.com.ar> <97E0CBC5EB794A11A2835644E2E3CC1D@JohanW7>
 <50C5C08D.407@zacarias.com.ar> <7EE27C3F912F450282DD2DE63A6A7FED@JohanW7>
Message-ID: <50C8A2CE.9050104@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/12/2012 12:26 PM, Sagaert Johan wrote:
> Hi
> 
> I was using the newer pthreads implementation,
> The old/stable pthreads are working for both lsusb (usbutils) and for usb_modeswitch with uClibc 0.9.33
> I did not try NTPL since this breaks the build of GDB.
> 
> I am not sure about what packages need the newer pthreads and what need the older/stable version.
> 
> Regards, Johan

Hi again.
Yes, the old/stable ones worked too now that i remember, they're pretty
well tested.
Packages don't depend on anyone in particular, the implementation is
just an uClibc internal thing.
Regards.
