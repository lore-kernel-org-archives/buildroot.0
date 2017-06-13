From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jun 2017 00:06:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/mcelog: fix legal-info
In-Reply-To: <CA+NV+V=d7D+-zZKO4NYVpGrsY2Uz0pqhrLqYPwGA2rXJZSq11g@mail.gmail.com>
 (Rahul Bedarkar's message of "Mon, 12 Jun 2017 22:38:17 +0530")
References: <20170612041512.9374-1-bernd.kuhls@t-online.de>
 <CA+NV+V=d7D+-zZKO4NYVpGrsY2Uz0pqhrLqYPwGA2rXJZSq11g@mail.gmail.com>
Message-ID: <87zidba6ff.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rahul" == Rahul Bedarkar <rahulbedarkar89@gmail.com> writes:

 > On Mon, Jun 12, 2017 at 9:45 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
 >> 
 >> README was renamed to README.md
 >> https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/README.md?id=2fda0091a0628480a08cbf6ebe309fcb83aeae34

 > make <pkg>-legal-info should have caught that after version bump as a
 > part of testing. But it looks like we don't do that usually. In past,
 > we have seen such failures after version bump.

 > To avoid such failures, we can add hash of license file in <pkg>.hash
 > and checking that after source is downloaded. If license file changes,
 > it will be noticed while build test after version bump.

 > Potentially, it will also help in keeping license string of packages
 > up-to-date if it gets changed. What do you think ?

Yes, this is something I have been thinking about as well (but not found
time to implement yet). +1 from here!

-- 
Bye, Peter Korsgaard
