From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 06 Apr 2015 16:18:38 +0200
Subject: [Buildroot] [PATCH 2/3] Transformation of package
 'at91bootstrap3' to KConfig style.
In-Reply-To: <55229545.4010103@mind.be>
References: <1425850629-14725-1-git-send-email-mc5686@mclink.it>
 <1425850629-14725-2-git-send-email-mc5686@mclink.it>
 <20150406122020.5ea2e6df@free-electrons.com> <20150406133219.GE4369@free.fr>
 <55229545.4010103@mind.be>
Message-ID: <552295BE.9090106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 16:16, Arnout Vandecappelle wrote:
>> > So, we could probably do something like:
>> > 
>> >     AT91BOOTSTRAP3_KCONFIG_FILE = boards/*/$(call qstrip,$(AT91BOOTSTRAP3_DEFCONFIG))_defconfig
>  Add a $(wildcard ...) around it, then you'll get the missing config file error
> if it doesn't match anything.

 Scratch that - it would give an error if the package isn't extracted yet.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
