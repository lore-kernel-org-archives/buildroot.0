From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Dec 2012 07:59:25 -0300
Subject: [Buildroot] usb_modeswitch and lsusb yield Segmentation fault
In-Reply-To: <97E0CBC5EB794A11A2835644E2E3CC1D@JohanW7>
References: <BCF3711885AE41AB966E9545FDB3C8D6@JohanW7>
 <50C54E15.1030008@zacarias.com.ar> <97E0CBC5EB794A11A2835644E2E3CC1D@JohanW7>
Message-ID: <50C5C08D.407@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/2012 07:57 AM, Sagaert Johan wrote:

> Hi
> 
> I am using buildroot's internal toolchain gcc 4.6.3 and uClibc 0.9.33.3
> and I the pthreads library.

Which threading implementation are you using? linuxthreads, linuxthreads
(stable/old) or Native POSIX Threading (NPTL) ?
NPTL should be the safe bet, i don't know how good/bad the others work
on later versions of uClibc.
Regards.
