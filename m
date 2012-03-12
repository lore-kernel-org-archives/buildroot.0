From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 12 Mar 2012 10:16:24 -0400
Subject: [Buildroot] [PATCH 2/2] BeagleBone: new board
In-Reply-To: <201203111532.04827.arnout@mind.be>
References: <1331214423-8647-1-git-send-email-fhunleth@troodon-software.com>
 <1331214423-8647-2-git-send-email-fhunleth@troodon-software.com>
 <201203111532.04827.arnout@mind.be>
Message-ID: <CA+-urNRbodw3ympsWpKTGS5-xtC0iawhJZWHAdoG3pN8UkMR9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 11, 2012 at 10:32 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Thursday 08 March 2012 14:47:03 Frank Hunleth wrote:
>> This configuration uses the latest released kernel and u-boot versions
>> supported by Beagleboard developers. The Linux kernel configuration has
>> been modified to compile in EXT2 support and use gzip to compress the
>> kernel.
>>
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>> ---
>> ?board/beaglebone/linux-3.2.9.config ? ? ? ? ? ? ? ?| 3572 ++++++++++++++++++++
>
> ?Please use 'make linux-update-defconfig' to create a defconfig. ?Then we
> don't have to add a 3500 line file.

I just sent an updated patch. Should be much easier to read now.

Thanks,
Frank
