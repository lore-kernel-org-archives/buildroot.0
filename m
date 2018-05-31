From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 31 May 2018 08:59:30 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-30
In-Reply-To: <20180531060010.26380206F6@mail.bootlin.com>
References: <20180531060010.26380206F6@mail.bootlin.com>
Message-ID: <CANQCQpZTUFsn6NjBdyhr-72JPDEw2VLQFv6mPpqNQexJe0F7Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 31, 2018 at 1:00 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Build statistics for 2018-05-30

> microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/a3aba71758feedac643fb00ea7ba6e23e1170b24 |


Looks like I missed a case where python was enabled and boost is built
for the Microblaze GCC bug.  I'll take a look.

Matt
