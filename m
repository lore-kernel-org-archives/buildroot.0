From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 18 Sep 2007 13:26:36 +0200
Subject: [Buildroot] AVR32 libiberty build failure
In-Reply-To: <46EF36B4.2000703@tait.co.nz>
References: <46EF36B4.2000703@tait.co.nz>
Message-ID: <20070918112636.GA2231@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 18, 2007 at 02:23:48PM +1200, Robin Gilks wrote:
> At least I think thats the problem...
>
> gcc builds OK and at the next step on a default config build for a atngw100 
> it fails.

Does this work with the current stable, buildroot gcc, i.e. our 4.2.1 with
buildroot patches?
It seems that you are using something like:
toolchain_build_avr32/gcc-4.1.2-avr32-2.0
