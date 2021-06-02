From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Jun 2021 22:33:53 +0200
Subject: [Buildroot] [PATCH] package/netperf: move SITE so s.b.n
In-Reply-To: <87v96wrw9p.fsf@tarshish>
References: <c160b9eba623c54debf9bf50d69cca4a6d6ed69e.1622119840.git.baruch@tkos.co.il>
 <7d24aa70-74c4-1166-e69f-5d8c7a5c6875@mind.be>
 <a7969129-6272-575d-0846-1874629cebc4@mind.be> <87v96wrw9p.fsf@tarshish>
Message-ID: <9b1f89a2-6047-cad0-91fd-39a91c67d6f2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/06/2021 19:50, Baruch Siach wrote:
> Hi Arnout,
> 
> On Wed, Jun 02 2021, Arnout Vandecappelle wrote:
>>>> -NETPERF_SITE = ftp://ftp.netperf.org/netperf
>>>> +NETPERF_SITE = http://sources.buildroot.net/netperf
>>
>>  We prefer buildroot.org over buildroot.net nowadays, so I changed that.
> 
> BR2_BACKUP_SITE still defaults to "http://sources.buildroot.net". Should
> we change that?

 It's just a nice-to-have. I applied your other patch with buildroot.net.

 Regards,
 Arnout
