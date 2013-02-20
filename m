From: Joe Halpin <jhalpin@luminatorusa.com>
Date: Wed, 20 Feb 2013 19:13:26 +0000
Subject: [Buildroot] build error: "fixdep: permission denied"
In-Reply-To: <87mwuzhqmf.fsf@dell.be.48ers.dk>
References: <7E1FF160F2C5E94FB297D1FE759079CAAD24@LUMEXCH3.luminatorusa.com>
 <87mwuzhqmf.fsf@dell.be.48ers.dk>
Message-ID: <7E1FF160F2C5E94FB297D1FE759079CAAF6C@LUMEXCH3.luminatorusa.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using Xubuntu 12.04, with ext4 file system.
And you're right, it doesn't happen when I build in my home directory. I'm not sure what that means, everything under /opt is owned by me. 
Thanks
Joe

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter Korsgaard
Sent: Wednesday, February 20, 2013 10:55 AM
To: Joe Halpin
Cc: buildroot at busybox.net
Subject: Re: build error: "fixdep: permission denied"

>>>>> "Joe" == Joe Halpin <jhalpin@luminatorusa.com> writes:

 Joe> When I try to build, I've been getting either this error or "... fixdep: not
 Joe> found". After I get this error, if I run make again, it all completes with no
 Joe> other errors.

 Joe> When I look at the directory, fixdep is there, and has the required
 Joe> permissions. I haven't been able to divine the problem from looking at the
 Joe> makefiles, so if anyone can point me in the right direction I'd appreciate it.

 Joe> I've been googling this, but haven't found a solution yet. I've seen this in
 Joe> 2012.11, 2012.11.1 and 2013.02_rc2.

Funky. Could you please provide some more details about your build setup
(Linux distribution, file system, ..)?

Does it work if you build it in your homedir instead?

-- 
Bye, Peter Korsgaard
