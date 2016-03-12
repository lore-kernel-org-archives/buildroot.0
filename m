From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Mar 2016 10:31:49 +0100
Subject: [Buildroot] [PATCH 1/1] olimex_imx233_olinuxino_defconfig:
 genimage support
In-Reply-To: <87shzxi54b.fsf@dell.be.48ers.dk>
References: <1457645651-2472-1-git-send-email-phil@zankapfel.net>
 <87shzxi54b.fsf@dell.be.48ers.dk>
Message-ID: <56E3E205.8090701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/16 13:14, Peter Korsgaard wrote:
>>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:
[snip]
>   > +# To generate SD Image
>   > +BR2_PACKAGE_HOST_GENIMAGE=y
>   > +BR2_PACKAGE_HOST_MTOOLS=y
>
> The vfat handling also uses mkdosfs, so we need to add
> BR2_PACKAGE_HOST_DOSFSTOOLS=y as well.
>
> I noticed that we are missing it from some of the other defconfigs as
> well, so I'll fix that.

  So, why doesn't Travis detect that?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
