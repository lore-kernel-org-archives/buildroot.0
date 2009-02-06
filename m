From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 6 Feb 2009 08:43:16 +0100
Subject: [Buildroot] uClibc-0.9.30-avr32-2.1.5.tar.bz2 is missing
References: <d6cda7730902041111h26b28bc7l4ab8f2fff3ef9e1c@mail.gmail.com>
	<F5677F2913BF4E44A9D6D3B4D74FB21C@aeglos>
	<d6cda7730902041425g5aab0fc3q44c25f2af088ae35@mail.gmail.com>
	<2CBF71990FD040DA91787A2E5CDEE141@aeglos>
	<d6cda7730902051833m4a9cd374saa37c6a66c2376c9@mail.gmail.com>
Message-ID: <E23A8E634B3144E18B0ADCB4712FCC3E@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
>
> On Wed, Feb 4, 2009 at 9:35 PM, Ulf Samuelsson <ulf.samuelsson@atmel.com> 
> wrote:
>> Hopefully, www.at91.com should be up and running sometime tomorrow.
>> Think they will put some priorit on this as soon as the problem is 
>> noticed.
>
>
> Still down :(
>
> And it's not just AVR32 that is affected, I can't build At91 as well:
> at91bootstrap-2.10.tar.bz2 is missing in buildroot mirror too.
>
> Best Regards,
>   Thiago A. Correa
>

It would make sense to automatically mirror a DL directory
to the mirror server as a cron job.
No need to restrict to autotools.

Best Regards
Ulf Samuelsson 
