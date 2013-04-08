From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Apr 2013 23:12:04 +0200
Subject: [Buildroot] Including wine package - Reg
In-Reply-To: <CAGK4xy6eXjG7MzWS81uNmthwd5ODBB_ae+DQMSFfPkX6_GfQiw@mail.gmail.com>
References: <CAGK4xy6eXjG7MzWS81uNmthwd5ODBB_ae+DQMSFfPkX6_GfQiw@mail.gmail.com>
Message-ID: <20130408231204.0b30b7df@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arunkumar Vijayakumar,

On Tue, 9 Apr 2013 01:19:42 +0530, Arunkumar Vijayakumar wrote:

> I'm including wine package in buildroot to run my windows
> application. But after building and testing with Qemu, when i type
> the command wine, its says
> 
> -sh: wine: not found, even though the wine binaries are in /usr/bin
> 
> Can you please help me with the solution.

Could you submit your wine package so that we can try to reproduce the
problem?

Which architecture are you targeting? What is the output of "file
output/target/usr/bin/wine" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
