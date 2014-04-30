From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 12:48:10 +0200
Subject: [Buildroot] The uClibc saga: next steps
Message-ID: <CAAXf6LUQb3a57R-ztncPtsRvouP=PxjoWn1fC1Xy3+XLhNTErA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

At the last buildroot developer days, we discussed the uClibc
situation at length [1]. We finally decided to try, once more, to take
it up with the uClibc community, requesting them to make a release. We
told them that we are considering to stop using uClibc as the default
C library in Buildroot.

Unfortunately, this approach failed to work, as did previous attempts.
The discussion on the uClibc mailing list is at [2].

Hence, I think it is time to discuss the next steps, which could possibly be:
- create a 'fork' of uClibc that just makes releases out of the
existing code in the uClibc sources.
- go forward with the plan to stop using uClibc as default C library,
and either promote musl or (e)glibc.
- (other possible steps here...)

What do you think?

Best regards,
Thomas


[1] http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014#How_to_handle_the_uClibc_problem

[2] http://lists.uclibc.org/pipermail/uclibc/2014-February/048252.html
http://lists.uclibc.org/pipermail/uclibc/2014-March/048269.html
