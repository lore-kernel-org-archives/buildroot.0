From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 1 Feb 2016 19:57:40 +0100
Subject: [Buildroot] [PATCH 2/5] docs/manual: slightly clarify patch
 licensing
In-Reply-To: <20160201195312.09e2d34f@free-electrons.com>
References: <1454338344-24973-1-git-send-email-luca@lucaceresoli.net>
 <1454338344-24973-3-git-send-email-luca@lucaceresoli.net>
 <20160201195312.09e2d34f@free-electrons.com>
Message-ID: <56AFAAA4.6050908@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
> Luca,
>
> On Mon,  1 Feb 2016 15:52:21 +0100, Luca Ceresoli wrote:
>> Adding a patch is a modification to Buildroot. Thus this sentence might be
>> interpreted as "Patches are released under the Buildroot license".
>>
>> Being a legal matter, the last thing we want is to be
>> ambiguous. Reword the sentence to avoid any misunderstandings.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>   docs/manual/patch-policy.txt | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
>> index 0b4604e..cfda5c5 100644
>> --- a/docs/manual/patch-policy.txt
>> +++ b/docs/manual/patch-policy.txt
>> @@ -90,8 +90,8 @@ If something goes wrong in the steps _3_ or _4_, then the build fails.
>>
>>   === Format and licensing of the package patches
>>
>> -Patches are released under the same license as the software that is
>> -modified.
>> +Patches are released under the same license as the software that they
>> +modify.
>
> "as the software that they apply to" ?

Indeed, they don't modify any file, `patch` does it! :)

Seriously, your version is better. We can even ditch "that":
"as the software they apply to".

Will fix and resend.

-- 
Luca
