From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 3 Mar 2017 15:56:07 +0100
Subject: [Buildroot] [RFC PATCH 8/9] support/scripts: check-host-rpath
 now handles $ORIGIN as well
In-Reply-To: <20170303154604.53543d88@free-electrons.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-9-git-send-email-wg@grandegger.com>
 <20170303154604.53543d88@free-electrons.com>
Message-ID: <a7bb4b63-b293-0a7e-4dba-288573ebd583@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 03.03.2017 um 15:46 schrieb Thomas Petazzoni:
> Hello,
>
> On Fri,  3 Mar 2017 15:18:52 +0100, Wolfgang Grandegger wrote:
>> $ORIGIN/../../usr/bin is also a valid rpath for binaries in
>> "$hostdir/usr/bin".
>
> I guess you meant $ORIGIN/../../usr/lib and $hostdir/usr/lib here,
> right?

"$ORIGIN/../../usr/lib" in ELF files in "$hostdir/usr/bin" *or* 
"$hostdir/usr/lib". IIRC, I think the problem was with some binaries in 
"usr/bin".

> Isn't this patch 8/9 actually a fix, which should come first in the
> series, and that we could/should apply quickly, independent from the
> rest?

Yes! I got it after an initial build. Can't remember what package made 
the problem. Going to a fresh re-make...

Wolfgang.
