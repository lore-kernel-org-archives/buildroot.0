From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Dec 2012 08:04:46 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <CAKvQZ_3P_nfpGsC+V6Z_eRjsmNssV-Pq0EDp0v78hfkY4vwdqg@mail.gmail.com>
 (Willy Lambert's message of "Tue, 11 Dec 2012 03:13:48 +0100")
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <87pq2hpnpq.fsf@dell.be.48ers.dk>
 <CAKvQZ_3P_nfpGsC+V6Z_eRjsmNssV-Pq0EDp0v78hfkY4vwdqg@mail.gmail.com>
Message-ID: <87lid5oyr5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Willy" == Willy Lambert <lambert.willy@gmail.com> writes:

 Willy> Yes, so I just quit it so it leaves the default config (which
 Willy> seems to have a problem with large file)
 >> 
 >> Ok, that also works here:
 >> 
 >> yes '' | make oldconfig
 >> make

Does that work for you?

 >> Notice that we have a bunch of preconfigured qemu defconfigs (look in
 >> configs/)
 >> 

 Willy> thanks for this tips I overlooked that. I'm on a x86 atom so
 Willy> there is little config to preset.

Is your build machine an atom? If so, beware that your build times are
going to be quite long. Don't you have access to any faster machines?

-- 
Bye, Peter Korsgaard
