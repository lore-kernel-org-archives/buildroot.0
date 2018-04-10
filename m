From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 10 Apr 2018 16:50:12 +0200
Subject: [Buildroot] Direct rendering with XORG and AMDGPU
In-Reply-To: <162E260C-3293-4AEE-9519-0D0E030168C6@gamecodehq.com>
References: <162E260C-3293-4AEE-9519-0D0E030168C6@gamecodehq.com>
Message-ID: <9b4d6bf4-0b92-f277-df89-bb841e35c501@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michal,

Le 10/04/2018 ? 16:31, Micha? Kalbarczyk a ?crit?:
> Hi,
> 
> I?m trying to build a firmware that support xorg and amdgpu with hardware acceleration. The build is made within nerves. I can?t get software rendering work.
> 
> Figured out that xorg driver reports empty list of supported cards.
> 
> If you want to look at configs please check GitHub repo: https://github.com/fazibear/nerves_system_xorg_x86_64 <https://github.com/fazibear/nerves_system_xorg_x86_64>
> 
> There is some dependencies that I missing?

Are you sure that your graphic card support is enabled in mesa3d package ?
Maybe you need radeonsi gallium driver which is not available currently.

Best regards,
Romain

> 
> Thanks for your help.
> Micha?.
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
