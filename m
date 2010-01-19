From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Jan 2010 17:12:53 +0100
Subject: [Buildroot] (no subject)
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19090208945D@mi8nycmail19.Mi8.com>
	(H. Hartley Sweeten's message of "Wed, 6 Jan 2010 17:07:27 -0500")
References: <BD79186B4FD85F4B8E60E381CAEE19090208945D@mi8nycmail19.Mi8.com>
Message-ID: <87iqaym5tm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Hello all,
 H> Does anyone know what happened to mkfs.jffs in mtd-utils?

 H> I recently updated my buildroot tree to the latest git.  This bumped
 H> the mtd-utils package from 1.1.0 to 1.2.0.  I did a make mtd-dirclean
 H> then started the make.  Eventually I got:

 H> cp -f /home/bigguiness/buildroot/output/build/mtd_orig/mkfs.jffs /home/bigguiness/buildroot/output/target/usr/sbin/mkfs.jffs
 H> cp: cannot stat `/home/bigguiness/buildroot/output/build/mtd_orig/mkfs.jffs': No such file or directory
 H> make: *** [/home/bigguiness/buildroot/output/target/usr/sbin/mkfs.jffs] Error 1

Hmm, it works here. Do you also have the problem if you do a clean
rebuild?

-- 
Bye, Peter Korsgaard
