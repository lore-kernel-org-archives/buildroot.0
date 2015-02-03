From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 3 Feb 2015 15:35:42 +0100
Subject: [Buildroot] [PATCH 1/3] fs/iso9660: allow building a hybrid ISO
	image
In-Reply-To: <CAOJKDvJR6jdHuQMq14GyRQDihSFEs-OMD+QDBSb8XRt7dBov9Q@mail.gmail.com>
References: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
 <CAAXf6LX9wcAVKwxHQYg2Ld7J+Ls36A+ZOFwdWwyLSkLsEkR9Rg@mail.gmail.com>
 <CAOJKDvJR6jdHuQMq14GyRQDihSFEs-OMD+QDBSb8XRt7dBov9Q@mail.gmail.com>
Message-ID: <CAAXf6LWGd=qMbMgivXYX6ExOgKmRBEgeMgODZtsvHFTvLV+URQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi No?,

On Tue, Feb 3, 2015 at 10:43 AM, No? RUBINSTEIN
<nrubinstein@aldebaran.com> wrote:
> Hi Thomas, thanks for your review.
>
> 2015-02-02 21:39 GMT+01:00 Thomas De Schampheleire <patrickdepinguin@gmail.com>:
>> > +config BR2_TARGET_ROOTFS_ISO9660_CUSTOM_BOOT_CONFIG
>> > +       bool "Use a custom boot config file"
>> > +       depends on BR2_TARGET_ROOTFS_ISO9660
>>
>> There should be some help text on this option: what is the format of
>> the config file, what is the default one, ... ?
>
> This is a bool option, and when toggled it shows option
> BR2_TARGET_ROOTFS_ISO9660_BOOT_CONFIG which has a visible default
> value. Should I add a link to
> http://www.syslinux.org/wiki/index.php/Isolinux.cfg and
> http://www.gnu.org/software/grub/manual/html_node/Configuration.html ?

Yes, that could be a good idea, along with some short explanation on
why a user would want this option, and what the default config file
does...

Thanks,
Thomas
