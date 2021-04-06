From: D. Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 22:52:43 +0000
Subject: [Buildroot] [PATCH 0/9] Bump all skarnet/s6 packages
In-Reply-To: <cb8b9b28-d2d4-3803-691d-00f538f3063f@mind.be>
References: <EAV9vrEvcxUDcc3PIGRVD5m8upmvXYeeRxC4tC6fNgM@cp4-web-032.plabs.ch>
 <cb8b9b28-d2d4-3803-691d-00f538f3063f@mind.be>
Message-ID: <oyxw0X8migIo8KrQUTRiTYvn3epvNllFHzBT6raMZBsAReWJzeNfofEaaXsbdR2kSaeW1ac5LSeZJnYhtDfek82zLdro46OfkZzWPxyW51o=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, thanks for catching that! I can confirm that no other changes have been made.

New patch revisions are coming shortly!

D. Olsson
PGP: 8204A8CD

On Tue, Apr 6, 2021 at 22:43, Arnout Vandecappelle <arnout@mind.be> wrote:

> Hi Dick,
>
> On 06/04/2021 19:57, Dick Olsson via buildroot wrote:
>> Quick patch set which bumps all skarnet/s6 packages to the latest version.
>>
>> Dick Olsson (9):
>> package/skalibs: bump to version 2.10.0.2
>> package/execline: bump to version 2.8.0.0
>> package/s6: bump to version 2.10.0.2
>> package/s6-portable-utils: bump to version 2.2.3.1
>> package/s6-linux-utils: bump to version 2.5.1.4
>> package/s6-linux-init: bump to version 1.0.6.1
>> package/s6-dns: bump to version 2.3.5.0
>> package/s6-networking: bump to version 2.4.1.0
>> package/s6-rc: bump to version 0.5.2.1
>
> Thanks for this series. I was about to apply, but it seems that the copyright
> year in the COPYING files has been updated to 2021. Could you double-check that
> there are no other changes, and update the hashes of the COPYING file accordingly?
>
> For now, I've marked the series as Changes Requested.
>
> Thanks,
> Regards,
> Arnout
>
>>
>> package/execline/execline.hash | 2 +-
>> package/execline/execline.mk | 2 +-
>> package/s6-dns/s6-dns.hash | 2 +-
>> package/s6-dns/s6-dns.mk | 2 +-
>> package/s6-linux-init/s6-linux-init.hash | 2 +-
>> package/s6-linux-init/s6-linux-init.mk | 2 +-
>> package/s6-linux-utils/s6-linux-utils.hash | 2 +-
>> package/s6-linux-utils/s6-linux-utils.mk | 2 +-
>> package/s6-networking/s6-networking.hash | 2 +-
>> package/s6-networking/s6-networking.mk | 2 +-
>> .../s6-portable-utils/s6-portable-utils.hash | 2 +-
>> .../s6-portable-utils/s6-portable-utils.mk | 2 +-
>> package/s6-rc/s6-rc.hash | 2 +-
>> package/s6-rc/s6-rc.mk | 2 +-
>> package/s6/s6.hash | 2 +-
>> package/s6/s6.mk | 2 +-
>> ...ker-use-dummy-file-when-testing-libs.patch | 44 -------------------
>> package/skalibs/skalibs.hash | 2 +-
>> package/skalibs/skalibs.mk | 2 +-
>> 19 files changed, 18 insertions(+), 62 deletions(-)
>> delete mode 100644 package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch
>>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210406/a0c4d4f3/attachment.html>
