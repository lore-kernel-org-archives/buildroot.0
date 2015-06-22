From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 22 Jun 2015 14:23:53 +0200
Subject: [Buildroot] [V2 3/4] A20-OLinuXino-Lime: new board (mainline)
In-Reply-To: <55848050.8010904@mind.be>
References: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
 <1434741204-3988-4-git-send-email-francois.perrad@gadz.org>
 <55848050.8010904@mind.be>
Message-ID: <5587FE59.8070607@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Arnout Vandecappelle wrote:
> On 06/19/15 21:13, Francois Perrad wrote:
>> config device tree / mainline (4.0.5)
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
>   Just some minor documentation fixes... With that:
>
>    Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Looks like your tag has not been picked up by patchwork (ART=0/0/1).
Maybe leading spaces are not taken into account?

[...]
>> +Copy images on the SD card
>> +--------------------------
>> +
>> +    # dd if=output/images/rootfs.ext2 of=/dev/sdX1
>
>   rootfs.ext4
>
>   Also, I personally prefer to use cat rather than dd, it's generally faster.

Interesting! I don't think there is any noticeable lag copying <7 MB to
an SD card... But since defconfigs are supposed to be used as a starting
point for real, and possibly large, projects, I'm fine with your
suggestion.

-- 
Luca
