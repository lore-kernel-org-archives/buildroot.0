From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 28 Aug 2018 22:35:46 +0200
Subject: [Buildroot] [PATCH next v3] atop: fix minor() major() build
 failure
In-Reply-To: <1964680083.3199118.1535473027893.JavaMail.zimbra@datacom.com.br>
References: <20180828133131.32838-1-giulio.benetti@micronovasrl.com>
 <1964680083.3199118.1535473027893.JavaMail.zimbra@datacom.com.br>
Message-ID: <621d3a24-7e53-6839-5276-7867682eb2c5@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 28/08/2018 18:17, Ricardo Martincoski ha scritto:
> Hello,
> 
> Giulio Benetti wrote:
> 
>> On arm / cortex-a8 Arch/Subarch sys/types.h doesn't include
>> sys/sysmacros.h which contains minor() and major() macros.
>>
>> Add patch to directly include <sys/sysmacros.h> into photosyst.c where
>> minor() and major() macros are used.
>>
>> Patch has been taken from atop upstream pull request:
>> https://github.com/Atoptool/atop/pull/35
>>
>> Fixes
>> http://autobuild.buildroot.net/results/3fc/3fc0f18ed94697c404e7ff3751781789170c4fe5//
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> 
> 
> Regards,
> --
> Ricardo Martincoski
> DATACOM
> Ethernet Switches
> Rua Am?rica, 1000 - Eldorado do Sul, RS - 92990-000 - Brasil
> +55 51 3933 3000 - Ramal 3307
> ricardo.martincoski at datacom.com.br
> www.datacom.com.br
> 

Thanks for reviewing.

Giulio Benetti
