From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 19 Feb 2015 18:42:10 -0300
Subject: [Buildroot] [PATCH 0/6] Build a Nios-II internal toolchain
In-Reply-To: <20150219222608.0b7cc308@free-electrons.com>
References: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20150219222608.0b7cc308@free-electrons.com>
Message-ID: <54E658B2.9040605@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/19/2015 06:26 PM, Thomas Petazzoni wrote:
> Dear Ezequiel Garcia,
> 
> On Tue, 17 Feb 2015 13:26:52 -0300, Ezequiel Garcia wrote:
> 
>> Ezequiel Garcia (6):
>>   gcc: 4.9.2: Add patch to remove a wrong header
>>   binutils: nios2: Prevent selecting unsupported versions
>>   gcc: nios2: Prevent selecting unsupported versions
>>   glibc: nios2: Prevent selecting unsupported versions
>>   linux-headers: nios2: Prevent selecting unsupported versions
>>   toolchain: Enable the internal toolchain for nios2
> 
> I did a test build, which went all fine and the patches look simple
> enough. Applied to next, thanks!
> 

Hoorray!

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
