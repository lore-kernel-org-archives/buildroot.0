From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Feb 2013 21:10:04 +0100
Subject: [Buildroot] build error: "fixdep: permission denied"
In-Reply-To: <7E1FF160F2C5E94FB297D1FE759079CAAF6C@LUMEXCH3.luminatorusa.com>
 (Joe Halpin's message of "Wed, 20 Feb 2013 19:13:26 +0000")
References: <7E1FF160F2C5E94FB297D1FE759079CAAD24@LUMEXCH3.luminatorusa.com>
 <87mwuzhqmf.fsf@dell.be.48ers.dk>
 <7E1FF160F2C5E94FB297D1FE759079CAAF6C@LUMEXCH3.luminatorusa.com>
Message-ID: <87ip5miw6b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joe" == Joe Halpin <jhalpin@luminatorusa.com> writes:

 Joe> I'm using Xubuntu 12.04, with ext4 file system.

 Joe> And you're right, it doesn't happen when I build in my home
 Joe> directory. I'm not sure what that means, everything under /opt is
 Joe> owned by me.

Odd. Could you paste output of:

cat /proc/mounts

-- 
Bye, Peter Korsgaard
