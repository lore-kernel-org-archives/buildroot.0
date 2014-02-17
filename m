From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 13:02:37 +0100
Subject: [Buildroot] [PATCH 1/1] iso9660: Added support for overlay
	directories
In-Reply-To: <20140217054228.20297e71@core2quad.morethan.org>
References: <1391549148-31993-1-git-send-email-martin@barkynet.com>	<5301B4E9.60902@mind.be>
 <20140217054228.20297e71@core2quad.morethan.org>
Message-ID: <5301FA5D.400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/14 12:42, Mike Zick wrote:
> On Mon, 17 Feb 2014 08:06:17 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>> On 04/02/14 22:25, Martin Bark wrote:
>>> This patch adds a variable BR2_TARGET_ROOTFS_ISO9660_OVERLAY that
>>> is similar to BR2_ROOTFS_OVERLAY except the files are placed in the
>>> iso9660 file system.
>>>
>>
> 
> Since Buildroot only builds root filesystems for the target device,
> it would probably be safe to drop the "TARGET_" distinction from
> that variable name.

 Agreed, but that should not be done in this patch. All the rootfs stuff
is currently using the BR2_TARGET_ROOTFS_ prefix, so this patch should
stick with that convention.

 Regards,
 Arnout

> 
> Mike
> 
>>> Signed-off-by: Martin Bark <martin@barkynet.com>  
>>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>
>>  I haven't tried it but it looks obviously-correct.
> 
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
