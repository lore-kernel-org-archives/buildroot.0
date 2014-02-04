From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Tue, 4 Feb 2014 12:26:54 +0100
Subject: [Buildroot] [PATCH] defconfigs: add sama5d3 support
In-Reply-To: <87y51rl01m.fsf@dell.be.48ers.dk>
References: <1391093726-7569-1-git-send-email-ludovic.desroches@atmel.com>
 <87y51rl01m.fsf@dell.be.48ers.dk>
Message-ID: <20140204112654.GD30185@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Feb 04, 2014 at 10:06:13AM +0100, Peter Korsgaard wrote:
> >>>>>   <ludovic.desroches@atmel.com> writes:
> 
>  > From: Ludovic Desroches <ludovic.desroches@atmel.com>
>  > Defconfig file for boards based on sama5d3x devices.
> 
>  > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>  > ---
> 
>  > Hi,
> 
>  > This is a basic defconf file for sama5d3 devices. at91boostrap, u-boot, linux
>  > stuff will come later.
> 
> Thanks, but we prefer our defconfigs to just be the minimal needed to
> configure buildroot for the hardware (arch/variant, bootloader, kernel)
> - E.G. something like configs/nitrogen6x_defconfig

Ok

> 
> Care to send such a minimal defconfig with comments instead?

Sorry, not sure to have understood, you mean I have to put extra packages I
want as comments.

> 
>  >> From the top of my head Alexandre Belloni told me that some flags have to be
>  > added for hardware floating point use. It was on a previous version when
>  > hard floating has been introduced. Is it still true or does selecting EABIHF is
>  > enough?
> 
> Selecting EABIHF should afaik be enough.
> 
> -- 
> Bye, Peter Korsgaard

Regards

Ludovic
