From: Ulf Samuelsson <ulfs@dof.se>
Date: Fri, 26 Jan 2007 19:45:39 +0100
Subject: [Buildroot] Using external toolchain / disabling
	Buildroottoolchain
References: <loom.20061213T195208-342@post.gmane.org>
	<loom.20070126T192656-570@post.gmane.org>
Message-ID: <02a401c7417c$928c0af0$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MikeW wrote:
> MikeW <mw_phil@...> writes:
>
>>
>> Buildroot cannot build a required toolchain, but I would still like
>> to use it to build everything else.
>>
>> Is there a preferred way to disable building the toolchain, and to
>> set Buildroot to use an external toolchain instead ?

It would be good to specify a toolchain once, and be done with
it, so you don't have to rebuild the toolchain
every time you start on a new version of buildroot.

>> (This is 'inside-out' from the BR docs which say how to use the BR
>> toolchain from outside.)
>>
>> Looking at the top-level Makefile, this looks as if it would involve
>> edits to the file(s).
>>
>> Regards,
>> MikeW
>>
>
> Looks like there's a possible patch here
> http://bugs.uclibc.org/view.php?id=237
>
> Don't you wish there was a 'patch gallery' ?!
>
> MikeW
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Best Regards,
Ulf Samuelsson
ulf at atmel.com
GSM:  +46 (706) 22 44 57
Tel:     +46  (8) 441 54 22
Fax:     +46 (8) 441 54 29
Mail: Box 2033  174 02 Sundbyberg
Visit: Kavalleriv?gen 24
          174 58 Sundbyberg'
Sweden
