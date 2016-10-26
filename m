From: Jeroen Roovers <jer@airfi.aero>
Date: Wed, 26 Oct 2016 17:19:49 +0200
Subject: [Buildroot] [git commit] tcpdump: bump version to 4.8.1
In-Reply-To: <20161026144219.gbxity3ht33wgsy6@sapphire.tkos.co.il>
References: <20161026103026.ED15581E81@busybox.osuosl.org>
 <CANCHnQp-rgEdvxh82WT=W51XGneryQJ=rx=qr+mRVBSmXFmCRQ@mail.gmail.com>
 <20161026162910.6e90e1a9@free-electrons.com>
 <20161026144219.gbxity3ht33wgsy6@sapphire.tkos.co.il>
Message-ID: <CANCHnQpLhXmWoj-rsuBdSGCri=ttGKtWEL+zy6zL6pxYYgYnmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 October 2016 at 16:42, Baruch Siach <baruch@tkos.co.il> wrote:
>> Also, should we add a comment in tcpdump.mk and libpcap.mk to indicate that
>> they should preferably be bumped together?
>
> I don't think there is a strict version dependency between tcpdump and
> libpcap. Previous versions (4.7.4 and 1.7.4, respectively) were not even
> released at the same date. See http://www.tcpdump.org/.

Hence "preferably", I guess.


Kind regards,
     jer
