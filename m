From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 21:54:26 +0100
Subject: [Buildroot] [PATCH 7/7] configs: remove old/broken Atmel
 configurations
In-Reply-To: <20151003204109.GH2694@piout.net>
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443901457-7914-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <20151003204109.GH2694@piout.net>
Message-ID: <56104082.6060805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 21:41, Alexandre Belloni wrote:
> Hi,
> 
> On 03/10/2015 at 20:44:17 +0100, Thomas Petazzoni wrote :
>> > The at91rm9200df_defconfig configuration is really old: it builds a
>> > 2.6.38 kernel with the old days kernel patches and a 2010.06
>> > U-Boot. It hasn't been updated since a long time, so let's get rid of
>> > it.
>> > 
>> > The at91sam9260dfc_defconfig, at91sam9261ek_defconfig and
>> > at91sam9263ek_defconfig refer to kernel defconfigs that no longer
>> > exists, so they fail to build.
>> > 
> I don't actually see any reason why they couldn't be updated. I'm
> actually using buildroot to build for my at91rm9200ek.
> 
> I'll try to update them. However, if you prefer deleting them in the
> meantime, that is fine.
> 

 There's no hurry to remove them.

 BTW, when updating these defconfigs, please make sure that the kernel headers
version and the kernel version are fixated.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
