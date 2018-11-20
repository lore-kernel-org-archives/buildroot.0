From: =?UTF-8?Q?DUPONCHEEL_S=c3=a9bastien?= <sebastien.duponcheel@corp.ovh.com>
Date: Tue, 20 Nov 2018 10:59:42 +0100
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: add connmarktos
 build option
In-Reply-To: <20181120090026.0091891c@windsurf.home>
References: <1542300189-12939-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
 <87o9aq5hcb.fsf@tkos.co.il>
 <25f6955b-c3f1-28a1-2a51-6ad90f391c9c@corp.ovh.com>
 <871s7jh1jd.fsf@tkos.co.il> <20181120090026.0091891c@windsurf.home>
Message-ID: <afd4825c-e58e-48ae-5562-b6ca221bec7c@corp.ovh.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, i am doing this ASAP.

Best regards,
DUPONCHEEL S?bastien.

Le 20/11/2018 ? 09:00, Thomas Petazzoni a ?crit?:
> Hello,
>
> On Sat, 17 Nov 2018 22:49:58 +0200, Baruch Siach wrote:
>
>>> config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
>>> - bool "enable connmarktos feature"
>>> + bool "ss-server: enable connmarktos feature"
>>>   depends on BR2_PACKAGE_SHADOWSOCKS_LIBEV
>>>   select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
>>>   help
>>> - Build with the connmark to TOS feature
>>> + Build ss-server with the connmark to TOS feature.
>>> + This feature require advanced tc, iptables and conntrac
>>> + rules to perform QoS on the server side.
>>> + if unsure say N.
>> Sounds reasonable to me. Let's see what others think.
> Yes, soon reasonable to me as well. Perhaps the option title should be:
>
> 	bool "conmarktos support in ss-server"
>
> or
>
> 	bool "ss-server conmarktos support"
>
> S?bastien, could you take into account the various comments received
> from Baruch, and send an updated version ?
>
> Thanks!
>
> Thomas
