From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 8 Oct 2014 15:57:42 +0100
Subject: [Buildroot] [PATCH v2] package/trinity: New package
In-Reply-To: <54355087.3090108@imgtec.com>
References: <1412763762-58202-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141008145331.GC3117@waldemar-brodkorb.de> <54355087.3090108@imgtec.com>
Message-ID: <543550E6.9070501@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2014 03:56 PM, Vicente Olivert Riera wrote:
> Dear Waldemar Brodkorb,
> 
> On 10/08/2014 03:53 PM, Waldemar Brodkorb wrote:
>> Hi,
>>
>> may be I missed it in v1, is there a reason for
>> depends on !BR2_TOOLCHAIN_USES_UCLIBC ?
> 
> This is the v1 patch. You can see the reason there.
> 

Still it's probably a good idea to have a comment in Config.in
since neither Config.in nor commit message explain the reason so one may
forget and remove the restriction in the future.

-- 
markos
