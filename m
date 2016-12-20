From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 20 Dec 2016 22:27:51 +0100
Subject: [Buildroot] [PATCH] toolchain-external: bump CodeSourcery AMD64
 to 2016.11-19
In-Reply-To: <20161220221836.672e059b@free-electrons.com>
References: <1482265769-6560-1-git-send-email-romain.naour@gmail.com>
 <20161220215452.447ee8f3@free-electrons.com>
 <9c743fd4-5835-aab9-01e4-17504a409416@gmail.com>
 <20161220221836.672e059b@free-electrons.com>
Message-ID: <f1436636-46cc-8253-990d-5bb3276b242d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 20/12/2016 ? 22:18, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Tue, 20 Dec 2016 22:15:16 +0100, Romain Naour wrote:
> 
>>> You don't have qemu-system-x86_64, really ? :-)  
>>
>> I can't use it with Qemu even with the current version or this new toolchain.
>> It doesn't boot at all, I don't even see the first kernel line.
>>
>> I'm using a Linux kernel 4.8.13 with qemu-2.4.1-11.fc23 or v2.8.0-rc2-8-gbd8ef50
> 
> Odd. What CPU variant are you using?

I'm using BR2_x86_steamroller, Qemu doesn't seems support it.

Romain

> 
> Maybe Gustavo has a clue?
> 
> Thomas
> 
