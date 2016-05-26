From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:18:00 +0200
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <5747443D.2020109@zacarias.com.ar>
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
 <20160526203517.1a2a3670@free-electrons.com>
 <57474262.2020500@zacarias.com.ar>
 <20160526204157.201c0d78@free-electrons.com>
 <5747443D.2020109@zacarias.com.ar>
Message-ID: <20160526211800.798637f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 15:45:17 -0300, Gustavo Zacarias wrote:

> Yes, that would be suitable, expect for 8 GB cards where you "loose" 
> space :)

Well, when you'll be shipping a product, you know what will be the size
of your eMMC / SD card, and it's gonna be the same for all your units,
so you can generate an image with the appropriate size.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
