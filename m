From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Wed, 17 May 2017 22:49:41 +0200
Subject: [Buildroot] RPi B+ update
In-Reply-To: <2C134724-B0DB-4EAB-907E-3C97364972DC@openadk.org>
References: <38b2ad6e-f9bd-c0f7-e5be-c0531fd22f2a@gmail.com>
 <20170516232354.2080bf15@gmx.net>
 <224ff827-03b8-16d6-34fd-8be05cea607d@gmail.com>
 <24ea86ee-9b48-816f-3e7a-6d5a985ea339@gmail.com>
 <2C134724-B0DB-4EAB-907E-3C97364972DC@openadk.org>
Message-ID: <a52ce23c-ed55-3ff3-5295-14270be23f1c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 17/05/2017 19:36, Waldemar Brodkorb ha scritto:
> what happens if you keep your old kernel and dtb and just update the firmware (start.elf, fixup.dat and the other file)?
>
> I think new firmware can handle dt and non-dt kernel. You might need to add the trailer magic to the old kernel with mkknlimg.


Il 17/05/2017 21:29, Peter Korsgaard ha scritto:

>
> Unless the system boots with new fw and the old zImage. Did you try that
> combination?


Hi both!
I've just tried to boot with the old zImage and the new firmware: it 
hangs on the colored background on power up. The same happens using 
mkknlimg on the old kernel.

Marco
