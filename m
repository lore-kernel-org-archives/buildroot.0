From: Alexjan Carraturo <axjslack@gmail.com>
Date: Mon, 25 Jul 2011 10:19:57 +0200
Subject: [Buildroot] [git commit] e2fsprogs: Add missing dependency of
	tst_uuid.o on uuid.h
In-Reply-To: <878vrmu67e.fsf@macbook.be.48ers.dk>
References: <20110724222706.574988B495@busybox.osuosl.org>
 <CACR8Qs_yv1OspsG_byHSTXm5pZ1UMgrMVj0GXf8Rvovk-4+Lpw@mail.gmail.com>
 <87pqkyu8gr.fsf@macbook.be.48ers.dk>
 <CACR8Qs_+2UPkMi4PLx-0m6sBtrSOtKa4Qwp_kju9Hmu+SmBgnQ@mail.gmail.com>
 <87d3gyu6x0.fsf@macbook.be.48ers.dk>
 <CACR8Qs-Ck_eSKgG2BxSAGaDWkBzLusoiGphaJnmmgUN=4CFfrg@mail.gmail.com>
 <878vrmu67e.fsf@macbook.be.48ers.dk>
Message-ID: <CACR8Qs_Nm6QtjsHxSjkUzr+_GBDh_7QFMHxfmoMXVFtFg+RAww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/7/25 Peter Korsgaard <jacmet@sunsite.dk>:
>>>>>> "Alexjan" == Alexjan Carraturo <axjslack@gmail.com> writes:
>
> Hi,
>
> ?Alexjan> make debug (with your patch)
>
> ?Alexjan> package/Makefile.in:144: *** separatore ?assente. ?Stop.
>
>
> ?Alexjan> Note: Separatore assente means "missing separator"
>
> Then something probably went wrong with the patch - The @echo lines have
> to be indented with a <tab>.
>
> Care to try again?
>

Ok... now I had the tab manually and seems working

CFLAGS=-O2 -I/home/buildroot/buildroot-20110722/buildroot/output/host/include
-I/home/buildroot/buildroot-20110722/buildroot/output/host/usr/include
CXXFLAGS=-I/home/buildroot/buildroot-20110722/buildroot/output/host/include
-I/home/buildroot/buildroot-20110722/buildroot/output/host/usr/include
LDFLAGS=-L/home/buildroot/buildroot-20110722/buildroot/output/host/lib
-L/home/buildroot/buildroot-20110722/buildroot/output/host/usr/lib
-Wl,-rpath,/home/buildroot/buildroot-20110722/buildroot/output/host/usr/lib


> --
> Bye, Peter Korsgaard
>



-- 
Alexjan Carraturo
--
Free Software User Group Italia administrator (http://www.fsugitalia.org)
Fedora/OpenSUSE Ambassador
member of FSFE Italian Team

Twitter/Facebook/Identica: axjslack
Blog: http://axjslack.wordpress.com
--
