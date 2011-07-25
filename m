From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jul 2011 10:15:17 +0200
Subject: [Buildroot] [git commit] e2fsprogs: Add missing dependency of
	tst_uuid.o on uuid.h
In-Reply-To: <CACR8Qs-Ck_eSKgG2BxSAGaDWkBzLusoiGphaJnmmgUN=4CFfrg@mail.gmail.com>
 (Alexjan Carraturo's message of "Mon, 25 Jul 2011 10:10:47 +0200")
References: <20110724222706.574988B495@busybox.osuosl.org>
 <CACR8Qs_yv1OspsG_byHSTXm5pZ1UMgrMVj0GXf8Rvovk-4+Lpw@mail.gmail.com>
 <87pqkyu8gr.fsf@macbook.be.48ers.dk>
 <CACR8Qs_+2UPkMi4PLx-0m6sBtrSOtKa4Qwp_kju9Hmu+SmBgnQ@mail.gmail.com>
 <87d3gyu6x0.fsf@macbook.be.48ers.dk>
 <CACR8Qs-Ck_eSKgG2BxSAGaDWkBzLusoiGphaJnmmgUN=4CFfrg@mail.gmail.com>
Message-ID: <878vrmu67e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexjan" == Alexjan Carraturo <axjslack@gmail.com> writes:

Hi,

 Alexjan> make debug (with your patch)

 Alexjan> package/Makefile.in:144: *** separatore  assente.  Stop.


 Alexjan> Note: Separatore assente means "missing separator"

Then something probably went wrong with the patch - The @echo lines have
to be indented with a <tab>.

Care to try again?

-- 
Bye, Peter Korsgaard
