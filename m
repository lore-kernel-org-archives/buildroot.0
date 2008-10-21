From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 21 Oct 2008 08:31:12 +0200
Subject: [Buildroot] Backdoors?
In-Reply-To: <878wsitgk8.fsf@macbook.be.48ers.dk>
References: <48FD816A.6050101@control.lth.se>
	<878wsitgk8.fsf@macbook.be.48ers.dk>
Message-ID: <48FD7730.1090001@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Anders" == Anders Blomdell <anders.blomdell@control.lth.se> writes:
> 
> Hi,
> 
>  Anders> Nowhere in the documentation, I can find the passwords for:
>  Anders> target/device/Atmel/atngw100/target_skeleton/etc/shadow:avr32:$1$TVWxUVs7$/ze18sFeD6F26w0hgyB6M.:13200:0:99999:7:::
> 
>  Anders> are they there only to provide a backdoor into generated systems? :-)
> 
> I guess so. Atmel people?
> 

root / roota
avr32 / avr32!

Documented in the AVR32 wiki on avrfreaks.net AFAIK. Did not know they 
made it into uclibc.org repository.

Feel free to remove them.

-- 
HC
