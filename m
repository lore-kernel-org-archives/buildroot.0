From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Sep 2015 12:54:57 +0200
Subject: [Buildroot] [RFC 2/6] system: clarify /dev management using
 devtmpfs + {mdev, eudev}
In-Reply-To: <55F00FA4.1040307@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-3-git-send-email-luca@lucaceresoli.net>
 <55EFFE90.8090200@mind.be> <55F00FA4.1040307@lucaceresoli.net>
Message-ID: <55F01001.8050206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-09-15 12:53, Luca Ceresoli wrote:
> Dear Arnout,
> 
> thanks for you review.
> 
> Arnout Vandecappelle wrote:
>> On 08-09-15 23:28, Luca Ceresoli wrote:
>>> We're going to introduce /dev management with mdev only (no devtmpfs),
>>> which will be called "Dynamic using mdev only".
>>>
>>> In preparation to that addition, clarify the current /dev managements
>>> systems which use devtmpfs with an additional tool. Otherwise
>>> "Dynamic using mdev" and "Dynamic using mdev only" wight look quite
>>> undistinguishable to mortals...
>>
>>   I would squash the change to the manual with patch 5/6 and squash the changes
>> to the Config.in prompts into patch 3/6, since these changes are related.
> 
> Well, to be picky about bisectability, the changes in this patch should
> stay together. Otherwise at some commit we'd have "Dynamic using
> devtmpfs + mdev" in kconfig but "Dynamic using mdev" in the docs.

 OK, so then keep this patch and include my Reviewed-by.

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
