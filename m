From: Martin Bark <martin@barkynet.com>
Date: Tue, 04 Feb 2014 00:00:41 +0000
Subject: [Buildroot] [PATCH 1/1] axel: fixed package download issue
In-Reply-To: <20140202091052.64e36322@skate>
References: <1391258818-19350-1-git-send-email-martin@barkynet.com>
 <20140202091052.64e36322@skate>
Message-ID: <52F02DA9.3000802@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 02/02/14 08:10, Thomas Petazzoni wrote:
> Dear Martin Bark,
>
> On Sat,  1 Feb 2014 12:46:58 +0000, Martin Bark wrote:
>> This patch updates axel.mk to download axel v2.4 from snapshot.debian.org.
>> The download from alioth.debian.org is currently broken resulting in a
>> malformed axel.2.4.tar.gz being downloaded and the build failing.  The
>> package is available instead from snapshot.debian.org.
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>
> As I explained, this problem is not specific to Axel, but to all
> package that download from Alioth. So I believe it would be better to
> have one single patch that changes all the Alioth URLs to other URLs,
> so that we can revert that single patch later on once Alioth is working
> again.
>
> Best regards,
>
> Thomas
>

Yes I agree.  I had not notice at first that all alioth was broken.  I 
see Ryan Barnett has submitted a patch to update all alioth urls now so 
hopefully that's will fix the issue.

Thanks

Martin
