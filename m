From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 09:34:59 +0200
Subject: [Buildroot] [PATCH 0/8] configs: defconfigs for Atmel boards
In-Reply-To: <CAMQcK5JsC7TpJ5pdWmF-6m8zUa0_gXKYUBWQwWEA0-tx2uONQw@mail.gmail.com>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
 <CAMQcK5JsC7TpJ5pdWmF-6m8zUa0_gXKYUBWQwWEA0-tx2uONQw@mail.gmail.com>
Message-ID: <20150501093459.1814ec0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, Alex,

On Thu, 30 Apr 2015 09:33:50 -0500, Ryan Barnett wrote:

> Since you are moving all of the Atmel boards to use NAND boot
> configuration, it would be good to have a 'README' that explains how
> to load the boards utilizing the SAM-BA tool (it appears all the NAND
> configurations are using this). At minimum it would be to point to
> Linux4SAM wiki for loading instructions.

Fully agreed.

Alexandre, please also include generating a NAND capable filesystem
image as part of those defconfig, so that they can easily be
flashed/used on the boards. I guess UBI images is going to be the most
appropriate solution. But clearly, such defconfigs should not generate
just a tarball.

Thanks

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
