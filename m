From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Mar 2016 19:39:00 +0200
Subject: [Buildroot] [PATCH v4 18/19] package/tvheadend: bump version
References: <1459194585-12593-1-git-send-email-bernd.kuhls@t-online.de>
 <1459194585-12593-19-git-send-email-bernd.kuhls@t-online.de>
 <20160329144510.0510cbe8@free-electrons.com>
 <20160330175440.5bb5dc43@free-electrons.com>
Message-ID: <XnsA5DBC7E422A27ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20160330175440.5bb5dc43 at free-electrons.com: 

>> It seems like tvheadend is no longer compatible with the current ffmpeg
>> version, since we haven't bumped to ffmpeg 3.0.
>> 
>> I guess I should revert the tvheadend bump for now?
> 
> Bernd, what do you think?

Hi Thomas,

instead of reverting the tvheadend bump my new ffmpeg 3.0 patch series
could be committed, it includes a uclibc-ng compilable vlc ;)

Regards, Bernd
