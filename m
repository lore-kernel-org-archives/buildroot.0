From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 14 Jan 2014 22:02:06 +0100
Subject: [Buildroot] [PATCH v3 2/2] ffmpeg: Add sse4 related options
 BR2_X86_CPU_HAS_SSE4 / BR2_X86_CPU_HAS_SSE4
In-Reply-To: <52D56F78.50304@mind.be>
References: <1388685585-23467-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP37762C5CD6B3E076E490852D9CB0@phx.gbl> <52D56F78.50304@mind.be>
Message-ID: <CAHXCMMLOCeXkkDZqTGvX4MGivUNW7dk3fE02Y228F=T6GqPHfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

2014/1/14 Arnout Vandecappelle <arnout@mind.be>

> On 02/01/14 18:59, Bernd Kuhls wrote:
>
>>
>> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
>> ---
>>   arch/Config.in.x86       |    4 ++++
>>   package/ffmpeg/ffmpeg.mk |   14 +++++++++++++-
>>   2 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
>> index ce30605..15d5c16 100644
>> --- a/arch/Config.in.x86
>> +++ b/arch/Config.in.x86
>> @@ -9,6 +9,10 @@ config BR2_X86_CPU_HAS_SSE3
>>         bool
>>   config BR2_X86_CPU_HAS_SSSE3
>>         bool
>> +config BR2_X86_CPU_HAS_SSE4
>> +       bool
>> +config BR2_X86_CPU_HAS_SSE42
>> +       bool
>>
>
>  Since nobody selects these symbols, this patch just adds dead code, right?
>

Well, I have a bump of opencv in the pipe that can use these new symbols
too.

Regards,


-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140114/afa3c89c/attachment.html>
