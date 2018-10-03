From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 03 Oct 2018 22:08:59 +0200
Subject: [Buildroot] [PATCH 1/1] linux-firmware: bump version and fix
 hash
References: <20180926223806.12704-1-nunes.erico@gmail.com>
 <87mus2vkos.fsf@dell.be.48ers.dk>
 <CAK4VdL0mu+5Od73gU4T7dRLVRHior7gYg6NQ3+bNKms9P5R=EQ@mail.gmail.com>
 <20181003194023.GA2383@scaer>
Message-ID: <r7kf8fx1pp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 03 Oct 2018 21:40:23 +0200 schrieb Yann E. MORIN:

> Weird; I do get the correct hash:
>     linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz: OK
>     (sha256:
>     b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916)

Hi,

same here on Debian buster:

linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz: OK 
(sha256: b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916)

with a private tar 1.29 binary to avoid building host-tar

$ which tar
/home/bernd/bin/tar
$ /home/bernd/bin/tar --version
tar (GNU tar) 1.29

Regards, Bernd
