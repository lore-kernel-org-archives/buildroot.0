From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 07 Nov 2012 20:24:11 +0100
Subject: [Buildroot] [PATCHv2 10/10] Make savedefconfig save to a
 configured file.
In-Reply-To: <509A1872.1040108@lucaceresoli.net>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
 <1351063027-13800-11-git-send-email-arnout@mind.be>
 <509A1872.1040108@lucaceresoli.net>
Message-ID: <509AB55B.7090307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/07/12 09:14, Luca Ceresoli wrote:
>> +1. Set +BR2_DEFCONFIG+ to +<path-to-board-directory>/buildroot.config+
>
> I've always been saving my Buildroot board config in configs/, to allow
> me to startup from a clean working copy with a simple:
>    make myboard_defconfig

  This was actually in the out-of-buildroot-tree section.  And I removed that
section completely, so it's irrelevant.

>
> The location you suggest requires a bit more typing, but it is probably
> cleaner, and it does not prevent me to continue my way... so:
>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

  Thanks for all your acks.  I've refreshed the patches, made some additional
fixes, and will repost right away.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
