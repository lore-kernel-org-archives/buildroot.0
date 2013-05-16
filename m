From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 May 2013 09:07:42 -0300
Subject: [Buildroot] [PATCH] poco: not available for all architectures
In-Reply-To: <20130516120521.GG4709@tarshish>
References: <1368704401-1832-1-git-send-email-gustavo@zacarias.com.ar>
 <20130516115453.GF4709@tarshish> <5194CAB9.8020102@zacarias.com.ar>
 <20130516120521.GG4709@tarshish>
Message-ID: <5194CC0E.7060803@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/16/2013 09:05 AM, Baruch Siach wrote:

>>> Enabling this comment when it is the architecture that is not supported might 
>>> confuse the user. Maybe we should add another comment? How is this handled in 
>>> other packages?
>>
>> I'm actually disabling the comment if it's not a supported architecture
>> with that line (same as the option itself).
> 
> Ah, right. I always get confused by reverse logic.

Normally we don't mention "your architecture isn't supported" because
there's not much the user can do about it ("hey, change your hardware!"
wouldn't be nice hehe).
Regards.
