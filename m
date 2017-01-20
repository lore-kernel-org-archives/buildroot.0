From: =?UTF-8?Q?Guillaume_GARDET_-_Olis=c3=a9o?= <guillaume.gardet@oliseo.fr>
Date: Fri, 20 Jan 2017 10:50:45 +0100
Subject: [Buildroot] [PATCH] SDL2_X11 depends on MMU (fork)
In-Reply-To: <20170120140848.0978edc6@free-electrons.com>
References: <20170119215327.10668-1-romain.naour@gmail.com>
 <20170120140848.0978edc6@free-electrons.com>
Message-ID: <3b2afc80-87db-c96a-963e-cd1dd8b25766@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


Le 20/01/2017 ? 04:08, Thomas Petazzoni a ?crit :
> Hello,
>
> On Thu, 19 Jan 2017 22:53:27 +0100, Romain Naour wrote:
>> From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
>>
>> Fixes autobuilder failure http://autobuild.buildroot.net/results/2f7/2f738830bf98eb7284f99c11856a8694467b3daa
>>
>> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
>> Cc: baruch at tkos.co.il
>> Cc: romain.naour at gmail.com
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>> Guillaume's email sent with git send-email seems rejected by the mailing list server...
>> ---
>>   package/sdl2/Config.in | 1 +
>>   1 file changed, 1 insertion(+)
> I've applied, after fixing two things:
Thanks.

>
>   - The commit title did not comply with our usual practice, it was
>     lacking a package prefix, "sdl2: ".
>
>   - The depends on BR2_USE_MMU dependency was not provided to the
>     Config.in comment as it should have been.

Thanks for fixing both.

Guillaume

>
> Thanks a lot!
>
> Thomas
