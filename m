From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Jul 2018 01:13:33 +0200
Subject: [Buildroot] [PATCH v3 4/4] configs: add linux boot logo to
 raspberrypi3 defconfig
In-Reply-To: <20180630210034.GE23012@scaer>
References: <1527628939-7389-1-git-send-email-angelo@amarulasolutions.com>
 <1527628939-7389-5-git-send-email-angelo@amarulasolutions.com>
 <20180630210034.GE23012@scaer>
Message-ID: <6e702b32-95d8-4de3-2140-75f0f3e912cf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-06-18 23:00, Yann E. MORIN wrote:
> Angelo, All,
> 
> On 2018-05-29 23:22 +0200, Angelo Compagnucci spake thusly:
>> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>>
>> This patch adds a custom boot up logo to the raspberrypi3
>> defconfig.
> 
> Why the rpi3, and not the otehr configs?
> 
> Note that I don't mind much, but I'd like we be a bit consistent in all
> our defconfigs. Either all the defconfigs use the BR logo, or none of
> them do.

 There just aren't many configs that have a framebuffer console. But indeed, it
would be good to add this to at least the pc and the qemu defconfigs.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
