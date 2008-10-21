From: Anders Blomdell <anders.blomdell@control.lth.se>
Date: Tue, 21 Oct 2008 12:09:32 +0200
Subject: [Buildroot] Backdoors?
In-Reply-To: <878wsitgk8.fsf@macbook.be.48ers.dk>
References: <48FD816A.6050101@control.lth.se>
	<878wsitgk8.fsf@macbook.be.48ers.dk>
Message-ID: <48FDAA5C.3060700@control.lth.se>
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
I would suggest removing them (or I could provide you with the passwords for at
least 3 of them (valka and avr32 took less than a second to find, atmel/root
about an hour, john-the-ripper still working on the valka/root))

Regards

Anders Blomdell

-- 
Anders Blomdell                  Email: anders.blomdell at control.lth.se
Department of Automatic Control
Lund University                  Phone:    +46 46 222 4625
P.O. Box 118                     Fax:      +46 46 138118
SE-221 00 Lund, Sweden
