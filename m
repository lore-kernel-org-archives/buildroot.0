From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 16:46:28 +0200
Subject: [Buildroot] [PATCH] package/e2fsprogs: bump to version 1.45.6
In-Reply-To: <20200425220154.18496-1-ryanbarnett3@gmail.com> (Ryan Barnett's
 message of "Sat, 25 Apr 2020 17:01:54 -0500")
References: <20200425220154.18496-1-ryanbarnett3@gmail.com>
Message-ID: <87lfm2pjqz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>

According to the release notes, this fixes a number of out of bounds
memory accesses - So committed to 2020.02.x, thanks.

https://github.com/tytso/e2fsprogs/blob/v1.45.6/doc/RelNotes/v1.45.6.txt

-- 
Bye, Peter Korsgaard
