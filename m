From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 27 Nov 2015 23:23:48 +0100
Subject: [Buildroot] [PATCH 2/2] unzip: new package
In-Reply-To: <5658CDAD.20304@mind.be>
References: <1448645881-32202-1-git-send-email-luca@lucaceresoli.net>
 <1448645881-32202-2-git-send-email-luca@lucaceresoli.net>
 <5658CDAD.20304@mind.be>
Message-ID: <5658D7F4.1010506@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Arnout Vandecappelle wrote:
> On 27-11-15 18:38, Luca Ceresoli wrote:
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Cc: Romain Naour <romain.naour@openwide.fr>
>> Cc: Jan Pedersen <jp@jp-embedded.com>
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks Arnout. However I have to Nack my own patch... I realized it
misses an if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS: busybox has unzip, but
it's less featured than the InfoZip's one.

I'll respin with that fixed.

Mmh, weird, busybox has 'unzip', but no 'zip'.

-- 
Luca
