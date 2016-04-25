From: Ubaldo Porcheddu <ubaldo@eja.it>
Date: Mon, 25 Apr 2016 15:34:40 +0100
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3
	with symlink
In-Reply-To: <20160425161610.4e5cbe87@armant.core.local.os.greenbone.net>
References: <1461442370-22393-1-git-send-email-ubaldo@eja.it>
 <871t5triwb.fsf@dell.be.48ers.dk> <81b71ac5323b1793405c3192b6ac5264@eja.it>
 <20160425161610.4e5cbe87@armant.core.local.os.greenbone.net>
Message-ID: <7c641e674768b186ec37e275adbd41da@eja.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ben,

Il 2016-04-25 15:16 Beno?t Allard ha scritto:
> On Mon, 25 Apr 2016 15:06:54 +0100
> Ubaldo Porcheddu <ubaldo@eja.it> wrote:
> 
>> Hi Peter,
>> 
>> Il 2016-04-25 13:07 Peter Korsgaard ha scritto:
>> >>>>>> "Ubaldo" == Ubaldo Porcheddu <ubaldo@eja.it> writes:
>> >
>> >  > Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
>> >
>> > Committed after expanding the commit message, thanks.
>> >
>> > I've also committed a change to sync the kernel version with what is
>> > used for rpi1/2 (E.G. the rpi-4.4.y branch). Care to verify that
>> > everything works correctly after that?
>> 
>> I just tested the new kernel version but it doesn't give me the login
>> prompt, the kernel seems to be booting fine as it can recognize my
>> keyboard but it doesn't accept any input.
>> 
> 
> I had something similar, removed the 'console=ttyAMA0...' from the
> cmdline.txt file, and it booted through. Mine was not able to recognize
> my keyboard, but with dropbear and an extra user I was able to login.

after removing the extra console declaration I can also get the login, 
my keyboard get recognized by the kernel but it doesn't work properly, 
seems to be adding extra characters after any key press.
