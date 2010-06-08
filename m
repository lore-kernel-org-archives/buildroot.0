From: Dmytro Milinevskyy <milinevskyy@gmail.com>
Date: Tue, 8 Jun 2010 22:54:31 +0300
Subject: [Buildroot] [PATCH] target skeleton definition
In-Reply-To: <AANLkTikq0K_QAcO7evZCpi9cwqkL_xczCDdYdUN_sCC_@mail.gmail.com>
References: <4c0d5b02.8c4bdf0a.5e33.ffff9c4e@mx.google.com> 
	<20100607230541.5f2bf769@surf> <87d3w2k0e0.fsf@macbook.be.48ers.dk> 
	<20100608000415.543cae7d@surf>
	<AANLkTikq0K_QAcO7evZCpi9cwqkL_xczCDdYdUN_sCC_@mail.gmail.com>
Message-ID: <AANLkTimGqWZLo20F77yKkPhiF7FFowRO0F1sI-zPaiHn@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, what should be done w/ target that depend on busybox skeleton?

-- Dima

On Tue, Jun 8, 2010 at 9:51 AM, Dmytro Milinevskyy
<milinevskyy@gmail.com> wrote:
> Thomas, I will rework the patch according to your suggestions.
> Should targets that depend on busybox skeleton use default one?
>
> -- Dima
>
> On Tue, Jun 8, 2010 at 1:04 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> On Mon, 07 Jun 2010 23:17:59 +0200
>> Peter Korsgaard <jacmet@uclibc.org> wrote:
>>
>>> ?Thomas> Personaly, I'd prefer if we could get rid of the "busybox"
>>> ?Thomas> skeleton altogether. I think Peter Korsgaard agreed with
>>> ?Thomas> this decision, but I'll let him restate his preference here.
>>>
>>> Yes, I think now would be a good moment to cleanup this stuff.
>>
>> So, Dmytro, could you update your patch to remove the busybox skeleton,
>> and just put the default skeleton in fs/skeleton ?
>>
>> You could indeed split it in two patches:
>>
>> ?* One doing the skeleton move
>>
>> ?* One adding the option to configure the skeleton
>>
>> Thanks,
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
