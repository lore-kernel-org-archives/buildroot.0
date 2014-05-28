From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 May 2014 22:04:12 +0200
Subject: [Buildroot] [PATCH 2 of 2] fs/tar: use qstrip to clean up build
	output
In-Reply-To: <cda34eac2826e87dffc2.1400762141@argentina> (Thomas De
 Schampheleire's message of "Thu, 22 May 2014 14:35:41 +0200")
References: <patchbomb.1400762139@argentina>
 <cda34eac2826e87dffc2.1400762141@argentina>
Message-ID: <87bnuhbrgj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > When using the tar filesystem method, the build output shows at the end:
 > echo " tar -c""f <br>/output/images/rootfs.tar -C <br>/output/target ." >>
 >                                     <br>/output/build/_fakeroot.fs

 > The inner set of quotes can be easily removed by properly stripping the tar
 > options (coming from the buildroot configuration).

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
