From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Jan 2013 09:17:34 +0100
Subject: [Buildroot] [PATCH v2 1/6] sg3_utils: new package
In-Reply-To: <201301152229.00798.yann.morin.1998@free.fr>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <201301152159.17888.yann.morin.1998@free.fr>
 <CAAfyv36XKECoCh4+Dx-revgX_hF9N7A94DqD=5zaNdo=4scm3g@mail.gmail.com>
 <201301152229.00798.yann.morin.1998@free.fr>
Message-ID: <50F6621E.8020305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/01/13 22:29, Yann E. MORIN wrote:
> Belisko, All,
>
> On Tuesday 15 January 2013 Belisko Marek wrote:
>> On Tue, Jan 15, 2013 at 9:59 PM, Yann E. MORIN<yann.morin.1998@free.fr>  wrote:
>>> SG3_UTILS_LICENCE = LGPLv2.1+ BSD-3c
>>> ifneq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
>>> SG3_UTILS_LICENCE += GPLV2+ BSD-3c
>>> endif
>> It's bit complicated. All library files are BSD only but utils files
>> are mixed (BSD + GPLv2).
>
> Then:
>
> SG3_UTILS_LICENSE = BSD-3c
> ifneq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
> SG3_UTILS_LICENSE += GPLV2+
> endif

  Agreed.

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
