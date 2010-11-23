From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Nov 2010 22:57:45 +0100
Subject: [Buildroot] How to make uImage compressed
In-Reply-To: <25B7AA6B-19A4-441C-9EDD-063D26310BD9@gmx.net>
References: <25B7AA6B-19A4-441C-9EDD-063D26310BD9@gmx.net>
Message-ID: <20101123225745.10be8084@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Nov 2010 17:55:41 +0100
Stefan Pachner <stefan_pachner@gmx.net> wrote:

> I am new to buildroot. I am happy to be able to generate a booting  
> uImage for my board and wonder how to generate a compressed one. u- 
> boot is claming that my uImage is uncompressed.

On ARM, the internal kernel compression is used, and not the
compression offered by mkimage/uImage. So even if mkimage claims your
image is not compressed, it in fact is.

Unless you're not talking about ARM, of course.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
