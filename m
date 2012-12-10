From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Dec 2012 23:05:37 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 (Willy Lambert's message of "Mon, 10 Dec 2012 22:30:39 +0100")
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
Message-ID: <87pq2hpnpq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Willy" == Willy Lambert <lambert.willy@gmail.com> writes:

Hi,

 Willy> Yes, so I just quit it so it leaves the default config (which
 Willy> seems to have a problem with large file)

Ok, that also works here:

yes '' | make oldconfig
make

 Willy> I'm not blocked I already have my root image (with large file
 Willy> enabled), I'm currently setting up qemu to test it, our remark is just
 Willy> that default config seems dummy.

Notice that we have a bunch of preconfigured qemu defconfigs (look in configs/)

-- 
Bye, Peter Korsgaard
