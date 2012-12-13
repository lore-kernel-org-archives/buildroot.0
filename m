From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Dec 2012 11:55:28 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <0BA8DAED-72C3-4B4D-AC0E-4A0B344D88F1@gmail.com> (Victor
 Hiairrassary's message of "Thu, 13 Dec 2012 11:45:41 +0100")
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
 <50C91790.6090202@mind.be>
 <0BA8DAED-72C3-4B4D-AC0E-4A0B344D88F1@gmail.com>
Message-ID: <87txrqkyqn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Victor" == Victor Hiairrassary <victor.hiairrassary.ml@gmail.com> writes:

 Victor> So maybe boost package should no more depend on BR2_LARGEFILE?

Ehh, what does that have to do with the compilation issue on Ubuntu
12.04 when you don't enable largefile?

Presumably boost is marked as needing largefile because it does?

-- 
Bye, Peter Korsgaard
