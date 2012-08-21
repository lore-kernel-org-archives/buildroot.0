From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Aug 2012 00:49:21 +0200
Subject: [Buildroot] [PATCH 5/5] buildroot: initramfs: Generate vmImage
 without builtin initramfs rootfs.
In-Reply-To: <CAJxxZ0NiToOrkAbk2Wd=YBJyAmVEMd108hHN2NhfwBBvd=efOQ@mail.gmail.com>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
 <1344330577-25159-5-git-send-email-sonic.adi@gmail.com>
 <20120811201335.09a3082e@skate>
 <CAJxxZ0NiToOrkAbk2Wd=YBJyAmVEMd108hHN2NhfwBBvd=efOQ@mail.gmail.com>
Message-ID: <50341071.90108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/13/12 12:32, Sonic Zhang wrote:
> This patch generates a pure kernel image (vmImage) for developers
> convenience in addition to the uImage which has initramfs linked in.

  This sentence makes a much clearer commit message :-)

  Also, I would call this image $(LINUX_IMAGE_NAME)-noinitramfs rather than
vmImage.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
