From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Oct 2016 17:42:19 +0300
Subject: [Buildroot] [git commit] tcpdump: bump version to 4.8.1
In-Reply-To: <20161026162910.6e90e1a9@free-electrons.com>
References: <20161026103026.ED15581E81@busybox.osuosl.org>
 <CANCHnQp-rgEdvxh82WT=W51XGneryQJ=rx=qr+mRVBSmXFmCRQ@mail.gmail.com>
 <20161026162910.6e90e1a9@free-electrons.com>
Message-ID: <20161026144219.gbxity3ht33wgsy6@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 26, 2016 at 04:29:10PM +0200, Thomas Petazzoni wrote:
> On Wed, 26 Oct 2016 16:21:14 +0200, Jeroen Roovers wrote:
> > libpcap releases follow tcpdump releases very closely, but libpcap in
> > buildroot is still at 1.7.4 while 1.8.1 came out along with tcpdump
> > 4.8.1 (and 1.8.0 accompanied 4.8.0).
> 
> Thanks for the notification. I've added Vicente in Cc, since he sent
> the patch bumping tcpdump.
> 
> Could anyone submit a patch to bump libpcap?

I plan to post a libpcap bump patch later today, unless someone else beats me 
to it.

> Also, should we add a comment in tcpdump.mk and libpcap.mk to indicate that 
> they should preferably be bumped together?

I don't think there is a strict version dependency between tcpdump and 
libpcap. Previous versions (4.7.4 and 1.7.4, respectively) were not even 
released at the same date. See http://www.tcpdump.org/.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
