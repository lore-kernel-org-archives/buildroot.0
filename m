From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 01 Jul 2014 10:49:50 +0200
Subject: [Buildroot] Is grub-bios-setup the way to go to make a bootable
	CF?
In-Reply-To: <CAEzGmjCgQmFhN9fuc_2z-Aj37k42Oyg4YmshkYbjy+pLAkFmEw@mail.gmail.com>
References: <CAEzGmjD9xC59mSjgPAr2GeB15cUwaExp7KfjbRyRMFVHD=92+g@mail.gmail.com>
 <20140627203224.1149e36a@free-electrons.com>
 <CAEzGmjCgQmFhN9fuc_2z-Aj37k42Oyg4YmshkYbjy+pLAkFmEw@mail.gmail.com>
Message-ID: <1430516.W2oeO2VcYf@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lennart,

On Monday 30 June 2014 10:23:06 Lennart Ramberg wrote:
> Thank you Thomas,
> 
> It helped to use sudo :-)
> to get rid of that annoying
> "cannot open `/boot/grub/device.map': No such file or directory."
Can you try patch that follows this mail (called "grub2: Specify boot 
partition")? Does it solve your issue?

[...]

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
