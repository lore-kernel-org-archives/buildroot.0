From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Sat, 15 May 2021 17:03:48 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] board/qemu/s390x: disable SSP when needed
In-Reply-To: <20210515145614.GM2506@scaer>
References: <20210509130634.1105988-1-fontaine.fabrice@gmail.com>
 <20210515145614.GM2506@scaer>
Message-ID: <87mtswdoob.fsf@oc8242746057.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Fabrice, All,
>
> On 2021-05-09 15:06 +0200, Fabrice Fontaine spake thusly:
>> Fix build failure raised since commit
>> 810ba387bec3c5b6904e8893fb4cb6f9d3717466 by disabling SSP when needed
>> 
>> Fixes:
>>  - https://gitlab.com/kubu93/buildroot/-/jobs/1247043361
>> 
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Applied to master, thanks.
>
> Alexander, is this something we can expect to land in mainline?
>
> Regards,
> Yann E. MORIN.
>

Hi Yann,

yes, i'm already looking into it.

Regards
Alex
