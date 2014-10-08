From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 8 Oct 2014 16:14:06 +0100
Subject: [Buildroot] [PATCH v2] package/trinity: New package
In-Reply-To: <543550E6.9070501@imgtec.com>
References: <1412763762-58202-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141008145331.GC3117@waldemar-brodkorb.de> <54355087.3090108@imgtec.com>
 <543550E6.9070501@imgtec.com>
Message-ID: <543554BE.8070601@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On 10/08/2014 03:57 PM, Markos Chandras wrote:
> On 10/08/2014 03:56 PM, Vicente Olivert Riera wrote:
>> Dear Waldemar Brodkorb,
>>
>> On 10/08/2014 03:53 PM, Waldemar Brodkorb wrote:
>>> Hi,
>>>
>>> may be I missed it in v1, is there a reason for
>>> depends on !BR2_TOOLCHAIN_USES_UCLIBC ?
>>
>> This is the v1 patch. You can see the reason there.
>>
>
> Still it's probably a good idea to have a comment in Config.in
> since neither Config.in nor commit message explain the reason so one may
> forget and remove the restriction in the future.
>

Patch resent including the information about why we disable this package 
for uClibc:

   http://patchwork.ozlabs.org/patch/397661/

Regards,

-- 
Vincent
