From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 May 2019 15:54:12 +0200
Subject: [Buildroot] [PATCH v4 3/3] .gitlab-ci.yml: add trigger per job
In-Reply-To: <de070254-9408-b33b-83d6-25477c1f5703@mind.be>
References: <7fdd9d95-c147-d5bf-ca56-c0fef507f737@mind.be>
 <5cbd187c3c9b_707a3f9fd611a0e8645dd@ultri5.mail>
 <de070254-9408-b33b-83d6-25477c1f5703@mind.be>
Message-ID: <ca4f384d-ef32-1f1d-45de-53f5cad208a7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/04/2019 09:19, Arnout Vandecappelle wrote:
>>>  Also, I'll squash patches 2 and 3. Patch 2 is really not worth much on its own
>>> IMO. It would make more sense to introduce the _base keys in a separate patch
>>> (i.e. moving the artifacts to _base) and include the variable name in that
>>> patch. But I don't think it's worth the effort to try to split like that.
>> OK. Please feel free to squash them.
>  I'll do that when I get around to applying them :-)

 I finally did...

 Patches 2 and 3 squashed and applied to master, thanks.

 Regards,
 Arnout
