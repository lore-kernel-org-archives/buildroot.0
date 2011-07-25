From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jul 2011 10:24:36 +0200
Subject: [Buildroot] [git commit] e2fsprogs: Add missing dependency of
	tst_uuid.o on uuid.h
In-Reply-To: <CACR8Qs_Nm6QtjsHxSjkUzr+_GBDh_7QFMHxfmoMXVFtFg+RAww@mail.gmail.com>
 (Alexjan Carraturo's message of "Mon, 25 Jul 2011 10:19:57 +0200")
References: <20110724222706.574988B495@busybox.osuosl.org>
 <CACR8Qs_yv1OspsG_byHSTXm5pZ1UMgrMVj0GXf8Rvovk-4+Lpw@mail.gmail.com>
 <87pqkyu8gr.fsf@macbook.be.48ers.dk>
 <CACR8Qs_+2UPkMi4PLx-0m6sBtrSOtKa4Qwp_kju9Hmu+SmBgnQ@mail.gmail.com>
 <87d3gyu6x0.fsf@macbook.be.48ers.dk>
 <CACR8Qs-Ck_eSKgG2BxSAGaDWkBzLusoiGphaJnmmgUN=4CFfrg@mail.gmail.com>
 <878vrmu67e.fsf@macbook.be.48ers.dk>
 <CACR8Qs_Nm6QtjsHxSjkUzr+_GBDh_7QFMHxfmoMXVFtFg+RAww@mail.gmail.com>
Message-ID: <874o2au5rv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexjan" == Alexjan Carraturo <axjslack@gmail.com> writes:

Hi,

 Alexjan> Ok... now I had the tab manually and seems working

 Alexjan> CFLAGS=-O2 -I/home/buildroot/buildroot-20110722/buildroot/output/host/include
 Alexjan> -I/home/buildroot/buildroot-20110722/buildroot/output/host/usr/include
 Alexjan> CXXFLAGS=-I/home/buildroot/buildroot-20110722/buildroot/output/host/include
 Alexjan> -I/home/buildroot/buildroot-20110722/buildroot/output/host/usr/include
 Alexjan> LDFLAGS=-L/home/buildroot/buildroot-20110722/buildroot/output/host/lib
 Alexjan> -L/home/buildroot/buildroot-20110722/buildroot/output/host/usr/lib
 Alexjan> -Wl,-rpath,/home/buildroot/buildroot-20110722/buildroot/output/host/usr/lib

Ok, that looks good. So far so good, could you send me (in private) the
output of the host-mtd build? E.G.

rm -rf output/build/host-mtd-*
make host-mtd >/tmp/log.txt 2>&1

and send me /tmp/log.txt

-- 
Bye, Peter Korsgaard
