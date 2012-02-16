From: Spenser Gilliland <spenser309@gmail.com>
Date: Thu, 16 Feb 2012 15:28:08 -0600
Subject: [Buildroot] [PATCH] Added microblaze patch
In-Reply-To: <201202141815.04894.arnout@mind.be>
References: <CA+appbNdaSajXPdKk4OTyj0WOmeu=9PKr-Sa=cwAZNr76ujLnA@mail.gmail.com>
 <CA+appbPADbFMF4qp2fnDw7mhkEcVZ2mUUTFRLKrPycV4PqQB6w@mail.gmail.com>
 <CA+appbMRckavhx=0tQ5zeLQeM=pi-N1Xv6AN6SD8LOC1_c+=uQ@mail.gmail.com>
 <201202141815.04894.arnout@mind.be>
Message-ID: <CA+appbNDg4GPmFmETYchXF3Hyf6aG40ufuCjYVxsaL3dQWdbKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

I've tried a make target of both <DTS_NAME>.dtb and
$(KERNEL_ARCH_PATH/boot/<DTS_NAME>.dtb with no success.  Are you sure
this is correct?  I've tried this both within buildroot and just on a
kernel tree directly with the microblaze toolchain.

Spenser

On Tue, Feb 14, 2012 at 11:15 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Tuesday 14 February 2012 06:02:26 Spenser Gilliland wrote:
>
>> I'm having an issue generating the dtb.??What is the command in the
>
>> kernel build needed to make a dts into a dtb. (should I just use dtc
>
>> directly?)
>
>>
>
>
> As I mentioned in an earlier mail:
>
>
> $(MAKE) <linux make flags> <dtc basename>.dtb
>
>
> Regards,
>
> Arnout
>
>
> --
>
> Arnout Vandecappelle arnout at mind be
>
> Senior Embedded Software Architect +32-16-286540
>
> Essensium/Mind http://www.mind.be
>
> G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
>
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>
> GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
>



-- 
Spenser Gilliland
Computer Engineer
Illinois Institute of Technology
