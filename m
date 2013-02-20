From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Feb 2013 21:56:43 +0100
Subject: [Buildroot] build error: "fixdep: permission denied"
In-Reply-To: <7E1FF160F2C5E94FB297D1FE759079CAB17F@LUMEXCH3.luminatorusa.com>
 (Joe Halpin's message of "Wed, 20 Feb 2013 20:12:28 +0000")
References: <7E1FF160F2C5E94FB297D1FE759079CAAD24@LUMEXCH3.luminatorusa.com>
 <87mwuzhqmf.fsf@dell.be.48ers.dk>
 <7E1FF160F2C5E94FB297D1FE759079CAAF6C@LUMEXCH3.luminatorusa.com>
 <87ip5miw6b.fsf@dell.be.48ers.dk>
 <7E1FF160F2C5E94FB297D1FE759079CAB17F@LUMEXCH3.luminatorusa.com>
Message-ID: <87ehgaiu0k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joe" == Joe Halpin <jhalpin@luminatorusa.com> writes:

 Joe> jhalpin-linux$ cat /proc/mounts
 Joe> /dev/sda5 /home ext4 rw,relatime,user_xattr,barrier=1,data=ordered 0 0
 Joe> /dev/sda7 /opt ext4 rw,relatime,user_xattr,barrier=1,data=ordered 0 0

That looks fine to me. Sorry, I don't really have any idea why it is
misbehaving under opt. I have a bunch of buildroot toolchains installed
under /opt (but they were built from my homedir) without problems.

-- 
Bye, Peter Korsgaard
