From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 4 Feb 2014 23:35:23 +0100
Subject: [Buildroot] [PATCH] dependencies.sh: cleanup dependencies.sh
In-Reply-To: <52F1132F.1050008@lucaceresoli.net>
References: <1391459047-23665-1-git-send-email-maxime.hadjinlian@gmail.com>
 <52F1132F.1050008@lucaceresoli.net>
Message-ID: <CAGduivzutuoD1mhfg6Oxo1DYKz+C+kak62Q0c=g_v7TehC3vuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4 Feb 2014 17:20, "Luca Ceresoli" <luca@lucaceresoli.net> wrote:
>
> Hi Maxime,
Hi Luca,
>
>
> Maxime Hadjinlian wrote:
>>
>> Cleanup mixed indents and remove commented lines.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>>   support/dependencies/dependencies.sh | 214
+++++++++++++++++------------------
>>   1 file changed, 107 insertions(+), 107 deletions(-)
>>
>> diff --git a/support/dependencies/dependencies.sh
b/support/dependencies/dependencies.sh
>> index 47d4d10..06386e6 100755
>> --- a/support/dependencies/dependencies.sh
>> +++ b/support/dependencies/dependencies.sh
>> @@ -1,199 +1,199 @@
>>   #!/bin/sh
>>   # vi: set sw=4 ts=4:
>> -#set -x
>>
>>   export LC_ALL=C
>>
>>   # Verify that grep works
>>   echo "WORKS" | grep "WORKS" >/dev/null 2>&1
>>   if test $? != 0 ; then
>> -       echo
>> -       echo "grep doesn't work"
>> -       exit 1
>> +echo
>> +echo "grep doesn't work"
>> +exit 1
>>   fi
>
>
> Are you really suggesting we should remove all nesting? Well, I guess
> there's been a problem with the e-mail or something...
Well, I asked Peter before doing this, the file contained mixed indents. We
thought it would be nice to have a consistent indent with the Mk files.

But if we find we don't want that because it removes clarity in the code. I
can perfectly resend with only the space/tab fixed.

I really don't have a strong opinion on this one. Thomas Petazzoni and Yann
E. Morin also found it disturbing.
Peter what is your decision ?
>
> --
> Luca
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140204/9857cf9c/attachment.html>
