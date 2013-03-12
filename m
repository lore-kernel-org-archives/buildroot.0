From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2013 18:40:34 +0100
Subject: [Buildroot] [PATCH 2/6] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <20130310145851.4f1f6539@skate>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <b55a35d2b1dc1f5bb2598cc8bb29f787407250bc.1362693453.git.yann.morin.1998@free.fr>
 <20130310145851.4f1f6539@skate>
Message-ID: <513F6892.7070409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/13 14:58, Thomas Petazzoni wrote:
> Maybe we could set the volume name to 'buildroot' ? I.e:
>
> 	tune2fs -L buildroot "${IMG}"

  I don't particularly like that. If you're going to add volume names, it 
should be configurable.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
