From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 30 Aug 2018 23:34:57 -0300 (BRT)
Subject: [Buildroot] genimage with GPT partition
In-Reply-To: <271051188.3137571.1535461079163.JavaMail.zimbra@datacom.com.br>
References: <ea-mime-5b8531d1-607c-3c8a0ad5@www-1.netcourrier.com>
 <271051188.3137571.1535461079163.JavaMail.zimbra@datacom.com.br>
Message-ID: <1710489386.3790867.1535682897241.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "DATACOM" <casantos@datacom.com.br>
> To: "LP" <lpdev@cordier.org>
> Cc: "buildroot" <buildroot@busybox.net>
> Sent: Tuesday, August 28, 2018 9:57:59 AM
> Subject: Re: [Buildroot] genimage with GPT partition

>> From: "LP" <lpdev@cordier.org>
>> To: "DATACOM" <casantos@datacom.com.br>
>> Cc: "buildroot" <buildroot@busybox.net>
>> Sent: Tuesday, August 28, 2018 8:28:17 AM
>> Subject: Re: [Buildroot] genimage with GPT partition
> 
>> Hi again,
> 
>> I think support for GPT would be a useful feature to add to the back log.
>> Carlos, would it be possible for you to share your custom script? It would save
>> me a lot of time not doing it from scratch.
> 
> [...]
> 
>>> genimage does not create GPT partitions. In my current project I made a
>>> tricky post-image script which uses sfdisk, mcopy and mkfs to craft a
>>> disk image with the required partitions. It's beautifully horrendous.
> 
> I will make a simplified (and readable) version and post it somewhere.

Done: https://patchwork.ozlabs.org/patch/964267/

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
