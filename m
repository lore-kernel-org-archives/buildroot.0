From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 14 Feb 2018 10:55:22 -0600
Subject: [Buildroot] Using cross tools without knowing the cross prefix
In-Reply-To: <CAAXf6LU9ZkpV+3wbjM_Ybb6F0DKsMY+8MUAd2SQi2ap2PnZ55A@mail.gmail.com>
References: <CAAXf6LU9ZkpV+3wbjM_Ybb6F0DKsMY+8MUAd2SQi2ap2PnZ55A@mail.gmail.com>
Message-ID: <CANQCQpb91QxytrxpOVuNC5jwK0bK-Ato8JHgD5r-J_Ei2_461Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Feb 12, 2018 at 6:39 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi,
>
[snip]
> While I'm currently mostly interested in cross-gdb, the problem is
> generic for cross-gcc, cross-g++, ... as well. Can we create a
> mechanism that solves this problem generically, for example by
> adding links cross-<tool> for every useful tool inside $(HOST_DIR)/bin?
> Or alternatively, use a second directory tree like:
> $(HOST_DIR)/bin/cross/{gcc,gdb,nm,readelf} etc. ?

I've noticed a similar concern when I have an application team
"re-tool" for a new target and the prefix change results in a
discussion about why is this changing.  It doesn't happen often
enough, but their is always an extra prefix variable in any
application developers configuration they maintain for the particular
target they use. I'd agree the generically named folder structure
would cleanup use and documentation from a SDK users perspective.

Matt
