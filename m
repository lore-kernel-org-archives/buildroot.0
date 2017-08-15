From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 12:12:01 +0200
Subject: [Buildroot] [PATCH 3/3] whois: bump to version 5.2.17
In-Reply-To: <20170815104048.28e8d41f@windsurf>
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
 <b5c9e26c4b8e652827b9d04dad2f821a329c3249.1502649259.git.baruch@tkos.co.il>
 <20170815041832.jyuew657zabwrplz@sapphire.tkos.co.il>
 <20170815104048.28e8d41f@windsurf>
Message-ID: <ea0e4f20-eb93-e6bb-a39a-b1eb25b72cd0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-08-17 10:40, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 15 Aug 2017 07:18:32 +0300, Baruch Siach wrote:
> 
>> On Sun, Aug 13, 2017 at 09:34:19PM +0300, Baruch Siach wrote:
>>> Fixes serious usability issues (Debian changelog):
>>>
>>>   * Fixed whois referrals for .com, .net, .jobs, .bz, .cc and .tv,
>>>     broken by an ICANN-mandated output change:
>>>     https://www.icann.org/resources/pages/rdds-labeling-policy-2017-02-01-en
>>>
>>> Use snapshot.debian.org for the .dsc reference, since files tend to
>>> disappear from the official Debian ftp site over time.
>>>
>>> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>  
>>
>> Why has this patch been marked 'Changes Requested'? It is independent of other 
>> patches in this series.
> 
> Because I always mark all patches in a series as Changes Requested if
> at least one of them had comments. 

 Moreover, it was exactly this patch which had changes requested (switching
upstream would change this patch completely).

> Indeed, if it's a patch series, we
> expect the submitter to resend a complete new iteration of the series,
> even if some patches remain unchanged.

 But in this case, there are in fact no changes requested in the series (or
rather, the request has been refuted). So I've changed the status back to New.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
