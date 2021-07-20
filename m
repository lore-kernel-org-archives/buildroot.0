From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 20 Jul 2021 23:09:05 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.67
In-Reply-To: <20210720224443.24edcd0f@windsurf>
References: <20210612173513.2253959-1-giulio.benetti@benettiengineering.com>
 <20210720224443.24edcd0f@windsurf>
Message-ID: <900065c9-8832-df20-35ac-ea69cbfe72e4@benettiengineering.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Thomas,

On 7/20/21 10:44 PM, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Sat, 12 Jun 2021 19:35:13 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Note: NSS 3.67(like NSS 3.66) requires NSPR 4.31.
>> Release Notes (not yet available, but should eventually land):
>> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.67_release_notes
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> This patch doesn't apply in master: master has libnss 3.65, and your
> patch assumes a code base that has libnss 3.66.
> 
> Also, according to your reply to this e-mail, libnspr 4.31 is needed as
> a requirement for this bump of libnss, so you should always resend both
> in a single series.

Ah sorry, you're right.

> Could you resend the libnspr and libnss version bumps in a single patch
> series, rebased on master ?


Sure I can. Here there is a "problem" if we can call it that way. It's 
from some month that they release very very fast. Now they are at NSS 
3.68 and NSPR 4.32 [1], but very soon there will be version 3.69. Even 
if I send version bumps, they will release another version before you 
apply for sure. Let's see if it gets slower.
They also stopped emitting the Release Notes that doesn't help[2].

What can I do? Do I send the latest I see in the moment I bump and 
that's it, right?

[1]: https://hg.mozilla.org/projects/nss
[2]: 
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
