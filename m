From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Wed, 15 Sep 2010 21:33:08 +0200
Subject: [Buildroot] external toolchain question
In-Reply-To: <201009152050.27019.yann.morin.1998@anciens.enib.fr>
References: <4C910D9F.2060308@carallon.com> <4C911336.6060003@googlemail.com>
	<201009152050.27019.yann.morin.1998@anciens.enib.fr>
Message-ID: <4C911F74.7040506@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 15.09.2010 20:50, schrieb Yann E. MORIN:
> Marcus, All,
>
> On Wednesday 15 September 2010 20:40:54 Marcus Osdoba wrote:
>> Personally I didn't yet try out crosstool-ng because the current
>> patchlevel of buildroot is a higher one (e.g. gcc 4.3.4 vs 4.3.5).
> Hmmm... crosstool-NG has gcc-4.4.3, and even 4.4.4 and 4.5.x in
> experimental status.
>
>
Sorry, I didn't want to dispraise your work. Crosstool-ng is amazing!

But I had a quick look into it and figured out:
BR has 4.3.5 since June 2010 and 4.4.4 since May 2010.
The crosstool-ng version 1.8.1 provides 4.3.4 and 4.4.3 as default. With 
experimental activated no 4.3.5 either.
The eglibc points to 2.10 (2.11stable/2.12exp) and glibc to 2.9 
(2.11.2stable/2.12exp).
So my overall (subjective) impression was that br has currently a higher 
patchlevel.


By the way, I completely agree with Peters opinion that crosstool-ng 
could provide "better" toolchains while br focusses on it's maintask. 
Crosstool-ng is designed to generate toolchains as a specialised tool - 
really great. I saw that integration of ct-ng in br (or more intuitive 
config wrapper) is quite a long time on the agenda. I think it would be 
very eligible to see it in br.
What is the current status of this idea?

Thanks for your great work.

Regards,
Marcus
