From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 16:29:10 +0200
Subject: [Buildroot] [git commit] tcpdump: bump version to 4.8.1
In-Reply-To: <CANCHnQp-rgEdvxh82WT=W51XGneryQJ=rx=qr+mRVBSmXFmCRQ@mail.gmail.com>
References: <20161026103026.ED15581E81@busybox.osuosl.org>
 <CANCHnQp-rgEdvxh82WT=W51XGneryQJ=rx=qr+mRVBSmXFmCRQ@mail.gmail.com>
Message-ID: <20161026162910.6e90e1a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Oct 2016 16:21:14 +0200, Jeroen Roovers wrote:
> libpcap releases follow tcpdump releases very closely, but libpcap in
> buildroot is still at 1.7.4 while 1.8.1 came out along with tcpdump
> 4.8.1 (and 1.8.0 accompanied 4.8.0).

Thanks for the notification. I've added Vicente in Cc, since he sent
the patch bumping tcpdump.

Could anyone submit a patch to bump libpcap? Also, should we add a
comment in tcpdump.mk and libpcap.mk to indicate that they should
preferably be bumped together?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
