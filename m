From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 11 Apr 2019 18:44:44 +0200
Subject: [Buildroot] [PATCH v3 1/2] support/testing: add xserver + Mesa
 OpenGL (GLX) + glxinfo
In-Reply-To: <20190411182447.4c1f8570@windsurf.home>
References: <20190411155805.4111-1-yohar@P-ASN-FIRESTORM.daviel.idf.intranet>
 <20190411182447.4c1f8570@windsurf.home>
Message-ID: <fb78f35d-583b-ddea-b4a0-bfad2bd03aa2@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 11/04/2019 ? 18:24, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Thu, 11 Apr 2019 17:58:04 +0200
> Youssef at smile.fr, Harmouch at smile.fr, youssef.harmouch at smile.fr wrote:
> 
>> From: Romain Naour <romain.naour@gmail.com>
>>
>> This test allow to check if the xserver with GLX is working properly.
>> This is a basic test but it allow to trigger the current bug reported
>> by [1].
>>
>> To test if the glxinfo test is working, you can change "-display :0" by
>> "-display :1" in the glxinfo command line.
>>
>> [1] https://bugs.buildroot.org/show_bug.cgi?id=11591
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> Signed-off-by: youssef <youssef.harmouch@smile.fr>
>> index 0000000000..5a28411f49
> 
> The patch was somehow damaged here, so I fixed it up, squashed PATCH
> 2/2 into this one, and applied.

Thanks for fixing the patch.

I'll check what's going on with git format-patch on Youssef's computer.

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
