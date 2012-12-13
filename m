From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Dec 2012 12:06:47 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <0BA8DAED-72C3-4B4D-AC0E-4A0B344D88F1@gmail.com>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
 <20121211171008.3b869509@skate> <50C7D14F.4060304@mind.be>
 <20121212111628.5d1e9dba@skate> <20121212120159.4292d70b@skate>
 <20121212120341.69a89e93@skate> <20121212134703.7461d9c7@skate>
 <874njrnroe.fsf@dell.be.48ers.dk> <20121212183204.718be669@skate>
 <87r4mvm3gv.fsf@dell.be.48ers.dk> <20121212232108.261e4b29@skate>
 <50C91790.6090202@mind.be> <0BA8DAED-72C3-4B4D-AC0E-4A0B344D88F1@gmail.com>
Message-ID: <50C9B6C7.6080502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/12/12 11:45, Victor Hiairrassary wrote:
> So maybe boost package should no more depend on BR2_LARGEFILE?

  That has no relation at all with gcc...

  _Maybe_ the new boost version has lost its dependency on largefile, but I
doubt it. I just tried it and it fails with a very cryptic error message.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
