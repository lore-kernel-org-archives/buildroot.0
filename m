From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 30 Apr 2015 16:40:28 +0200
Subject: [Buildroot] [PATCH 0/8] configs: defconfigs for Atmel boards
In-Reply-To: <CAMQcK5JsC7TpJ5pdWmF-6m8zUa0_gXKYUBWQwWEA0-tx2uONQw@mail.gmail.com>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
 <CAMQcK5JsC7TpJ5pdWmF-6m8zUa0_gXKYUBWQwWEA0-tx2uONQw@mail.gmail.com>
Message-ID: <20150430144028.GC12076@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/04/2015 at 09:33:50 -0500, Ryan Barnett wrote :
> Since you are moving all of the Atmel boards to use NAND boot
> configuration, it would be good to have a 'README' that explains how
> to load the boards utilizing the SAM-BA tool (it appears all the NAND
> configurations are using this). At minimum it would be to point to
> Linux4SAM wiki for loading instructions.
> 
> Thoughts?
> 

Sure, I'm actually planning to provide the tcl scripts to use with
SAM-BA to help people load the generated images on their board.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
