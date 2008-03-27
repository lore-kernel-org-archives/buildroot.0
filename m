From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Mar 2008 16:44:20 +0100
Subject: [Buildroot] make clean problem and patch
In-Reply-To: <47EB6E57.4080101@logicway.de> (Arndt Kritzner's message of "Thu\,
	27 Mar 2008 10\:52\:23 +0100")
References: <47EB6E57.4080101@logicway.de>
Message-ID: <87y784qii3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arndt" == Arndt Kritzner <kritzner@logicway.de> writes:

Hi,

 Arndt> "make clean" fails after incomplete build attempts because of
 Arndt> missing files or directories. The attached patch precedes the
 Arndt> clean actions with a "-" to ignore these errors. With
 Arndt> atstk1002_defconfig the packages avahi, dropbear, file, lzo,
 Arndt> ncftp and strace caused this sort of aborts.  The attached
 Arndt> patch concerns these packages.

Thanks - I've checked in an extended version of this as r21516.

-- 
Bye, Peter Korsgaard
