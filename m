From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 29 Mar 2014 00:01:08 +0100
Subject: [Buildroot] [PATCH 2/9] manual/configure.txt: fix typo
In-Reply-To: <20140328223234.393ada17@skate>
References: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>	<1396041895-29533-3-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20140328223234.393ada17@skate>
Message-ID: <5335FF34.7080703@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,

> Dear Jerzy Grzegorek,
>
> On Fri, 28 Mar 2014 22:24:43 +0100, Jerzy Grzegorek wrote:
>> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>> ---
>>   docs/manual/configure.txt |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
>> index 16c86cc..869066a 100644
>> --- a/docs/manual/configure.txt
>> +++ b/docs/manual/configure.txt
>> @@ -165,7 +165,7 @@ Then, you have three solutions to use an external toolchain:
>>     prefix+ and +External toolchain C library+ options. Then, you have
>>     to tell Buildroot what your external toolchain supports. If your
>>     external toolchain uses the 'glibc' library, you only have to tell
>> -  whether your toolchain supports C\+\+ or not and whether it has
>> +  whether your toolchain supports C++ or not and whether it has
> Have you checked if the rendered files of the manual are still correct
> after this? IIRC, these backslashes were needed because ++ is a valid
> asciidoc construct.

Ah yes, right. I have removed one slash too much.
It should be:  C\++
Thanks for reviewing.

Regards,
Jerzy

>
> Thomas
