From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 29 Oct 2019 00:18:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/alljoyn*: Remove alljoyn suite
 packages
In-Reply-To: <20191028224038.GD2892@scaer>
References: <20191027233917.123833-1-titouan.christophe@railnova.eu>
 <20191028212038.GC2892@scaer> <13c8249f-52ee-308d-988e-899843f774d6@smile.fr>
 <20191028224038.GD2892@scaer>
Message-ID: <0f51ddd9-93b1-a52d-a87a-0fc28bd6b16b@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann and Romain,

On 10/28/19 11:40 PM, Yann E. MORIN wrote:
> Romain, All,
> 
> On 2019-10-28 23:17 +0100, Romain Naour spake thusly:
>> Le 28/10/2019 ? 22:20, Yann E. MORIN a ?crit?:
>>> Titouan, All,
>>>
>>> On 2019-10-28 00:39 +0100, Titouan Christophe spake thusly:
>>>> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
>>
>> Can you explain why you want to remove theses packages?
>> Indeed there is no activity since 2 years, is it unmaintained ?
> 
> See the thread about that:
>      http://lists.busybox.net/pipermail/buildroot/2019-October/264360.html
> 
> Regards,
> Yann E. MORIN.

I discussed this with Romain IRL, and I also think I should have make 
this clear in the commit msg.

Anyway, since I need to fix the Config.in.legacy, I'll add this too.

> 
>> Best regards,
>> Romain
>>
>>>> ---
>>>>   DEVELOPERS                                    |  4 -
>>>>   package/Config.in                             |  4 -
>>>
>>> You forgot to add the removed packages to Config.in.legacy...

Woops !

>>>
>>> Regards,
>>> Yann E. MORIN.

Thx for your reviews !

Kind regards,
Titouan
