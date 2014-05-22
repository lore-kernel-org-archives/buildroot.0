From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 22 May 2014 13:27:06 +0100
Subject: [Buildroot] [PATCH v2] libnss: Enable for MIPS64 n32 platforms
In-Reply-To: <20140522140609.30baa089@free-electrons.com>
References: <1400753901-49457-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140522140609.30baa089@free-electrons.com>
Message-ID: <537DED1A.9020902@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/22/2014 01:06 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Thu, 22 May 2014 11:18:21 +0100, Vicente Olivert Riera wrote:
>
>>   ifeq ($(BR2_ARCH_IS_64),y)
>> +ifeq ($(BR2_MIPS_NABI32),)
>>   LIBNSS_BUILD_VARS += USE_64=1
>>   endif
>> +endif
>
> I'm sorry to be annoying here, but do you think we could add a comment
> above this to explain why BR2_MIPS_NABI32 is handled specially here?

You don't need to say sorry, Thomas. It's a good idea, I will add a comment.

> Thanks!

Thanks to you.

> Thomas
>


-- 
Vincent
