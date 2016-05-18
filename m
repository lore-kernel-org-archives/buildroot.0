From: Martin Kelly <martin@surround.io>
Date: Wed, 18 May 2016 16:03:56 -0700
Subject: [Buildroot] [PATCH v3] Config.in: add -Og option
In-Reply-To: <bb06b33b-475c-3f3d-7482-36b98aff0be3@mind.be>
References: <1463606275-21768-1-git-send-email-martin@surround.io>
 <bb06b33b-475c-3f3d-7482-36b98aff0be3@mind.be>
Message-ID: <573CF4DC.2020009@surround.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/18/2016 03:25 PM, Arnout Vandecappelle wrote:
> On 05/18/16 23:17, Martin Kelly wrote:
>> -Og (introduced in GCC 4.8) lets you optimize for debugging experience,
>> which can be useful for when you want optimized code that is nonetheless
>> debuggable.
>>
>> Signed-off-by: Martin Kelly <martin@surround.io>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>   For next, obviously.
>
>   As I wrote separately, rewrapping the entire Config.in can be done in
> a separate patch.
>

I'd be happy to submit a rewrapping patch, once this one is accepted (to 
avoid merge conflicts). However, it has high merge conflict potential. 
I'll base it on next, but it may need a bit of fixing up before being 
accepted if any patches go in between submission and acceptance.
