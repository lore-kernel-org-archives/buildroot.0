From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 04 Apr 2013 13:38:15 +0200
Subject: [Buildroot] [PATCH] Install DTB as part of images install
	command
In-Reply-To: <515D6009.5010306@mind.be>
References: <069B5A25F9844945B625ADE7258AC94C06204FCC@4rf-nz-orion.local.4rf.com>
 <515D6009.5010306@mind.be>
Message-ID: <515D6627.7000803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/04/13 13:12, Arnout Vandecappelle wrote:
>>
>>   define LINUX_INSTALL_IMAGES_CMDS
>>          cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
>> +       $(LINUX_INSTALL_DTB)
>
>   I prefer the indentation to be with a tab, but since the original has
> spaces it's OK.

  Scratch that, the patch is whitespace-modified and doesn't apply (the 
original _does_ have tabs). Could you resend with git send-email?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
