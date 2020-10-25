From: Vadym Kochan <vadym.kochan@plvision.eu>
Date: Sun, 25 Oct 2020 20:01:57 +0200
Subject: [Buildroot] [PATCH] package/keepalived: make suport for Linux
 headers >= 3.2
In-Reply-To: <20201025102518.410aa9f3@windsurf.home>
References: <20201016122240.4235-1-vadim4j@gmail.com>
 <20201016142757.1849f560@windsurf> <20201016135120.GA4852@plvision.eu>
 <20201016200753.400e6757@windsurf> <20201025102518.410aa9f3@windsurf.home>
Message-ID: <vrcxh24kmikwve.fsf@plvision.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> Hello Vadym,
>
> On Fri, 16 Oct 2020 20:07:53 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
>> On Fri, 16 Oct 2020 16:51:20 +0300
>> Vadym Kochan <vadym.kochan@plvision.eu> wrote:
>> 
>> > > Was the kernel headers check in keepalived mentioned in the commit log
>> > > fixed later on ?
>> > >     
>> > 
>> > Looks like the original issue was related to ipset.  
>> 
>> Right, and ? Why has the issue disappeared ?
>
> Since I got no reply on this question, I've marked the patch as Changes
> Requested. Do not hesitate to send an updated version of the patch,
> with a more detailed commit log that provides additional explanations.
>
> Thanks!
>
> Thomas

Yes, thats OK as I plan to do more deep investigation by testing of
several builds with and without ipset tools, just still had no time.
It seems to me that Config.in needs some additional condition by
considering if ipset is enabled or not.

Regards,
Vadym
