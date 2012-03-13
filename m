From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 13 Mar 2012 18:34:55 +0100
Subject: [Buildroot] Fwd: Re: [PATCH 3/5] Microblaze: Added Xilinx toolchain
 options
Message-ID: <4F5F853F.8040200@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 12.03.2012 23:06, schrieb Thomas Petazzoni:
> Hello,
>
> Le Sun, 11 Mar 2012 17:49:24 +0100,
> Stephan Hoffmann <sho@relinux.de> a ?crit :
>
>> Signed-off-by: Stephan Hoffmann <sho@relinux.de
>>
>> ---
>>  toolchain/toolchain-external/Config.in |    5 +++++
>>  1 files changed, 5 insertions(+), 0 deletions(-)
>>
>>
> This should be squashed into PATCH 2/5, and it should also be done
> similarly for the big endian MicroBlaze toolchain (unless its uClibc
> configuration has none of those features).
You are right. I will fix this and resend the series of patches tonight.

I do not know anything about the big endian one because I only use the newer
little endian microblaze.

Stephan
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de




-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
