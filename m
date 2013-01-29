From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 29 Jan 2013 11:39:42 +0100
Subject: [Buildroot] [PATCH] Docu: Add LIBFOO_EXTRACT_CMDS
In-Reply-To: <CAHXCMM+zLhKOZaz9YAw=s147nSOBgP-WUAOFWhjaNafbjAQ4TA@mail.gmail.com>
References: <1359453890-23460-1-git-send-email-sho@relinux.de>
 <CAHXCMM+zLhKOZaz9YAw=s147nSOBgP-WUAOFWhjaNafbjAQ4TA@mail.gmail.com>
Message-ID: <5107A6EE.3060607@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 29.01.2013 11:18, schrieb Samuel Martin:
> Hi Stephan,
>
> 2013/1/29 Stephan Hoffmann <sho@relinux.de>:
>> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
>> ---
>>  docs/manual/adding-packages-generic.txt |    3 +++
>>  1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
>> index 7b8561a..53c8c21 100644
>> --- a/docs/manual/adding-packages-generic.txt
>> +++ b/docs/manual/adding-packages-generic.txt
>> @@ -288,6 +288,9 @@ LIBFOO_VERSION = 2.32
>>  Now, the variables that define what should be performed at the
>>  different steps of the build process.
>>
>> +* +LIBFOO_EXTRACT_CMDS+ lists the actions to be performed to
>> +  extract the package in case no standard method applies
> It could be nice to add what are the standard/supported methods
Sure. But I do not know them, I just decided to document this one
because I had to search for the information recently.

>
>> +
>>  * +LIBFOO_CONFIGURE_CMDS+ lists the actions to be performed to
>>    configure the package before its compilation.
>>
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Regards,
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
