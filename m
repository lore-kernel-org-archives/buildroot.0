From: psnsilva <psnsilva.stuff+nabble@gmail.com>
Date: Thu, 5 Jun 2014 03:25:33 -0700 (PDT)
Subject: [Buildroot] Check root file system at boot time
In-Reply-To: <20140604170914.GA3325@free.fr>
References: <1401897756168-71600.post@n4.nabble.com>
 <20140604170914.GA3325@free.fr>
Message-ID: <1401963933710-71653.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
Thank you by your time.

I usually properly shutdown the rPi triggering "poweroff" or "reboot".
However, the system I am build is to be installed at an uncontrolled
environment, where power interruptions can occur.

As you say, I would expect that in this case the "filesystem "driver" in the
kernel" automatically check the file system at boot time, but it's not
happening. I think I have all the necessary tools (e2fstools) and
configurations on my systems, but I should be missing something here.

Thank you very much,
Pedro Silva




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Check-root-file-system-at-boot-time-tp71600p71653.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
