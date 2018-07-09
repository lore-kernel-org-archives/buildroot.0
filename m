From: Leon Anavi <leon.anavi@konsulko.com>
Date: Mon, 9 Jul 2018 16:49:12 +0300
Subject: [Buildroot] [PATCH]
 configs/olimex_a10_olinuxino_lime_defconfig: new board
In-Reply-To: <bdb14ace-9729-9b01-5b53-7903dd5f88db@mind.be>
References: <1530777523-19802-1-git-send-email-leon.anavi@konsulko.com>
 <bdb14ace-9729-9b01-5b53-7903dd5f88db@mind.be>
Message-ID: <e178b857-7e48-e057-1727-137502079cfe@konsulko.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

Thank you for the feedback. Following your recommendations I have
created sym links, add more info in the Git commit message, exported the
patch with -v4 option and submitted the 4th version of this patch:
http://lists.busybox.net/pipermail/buildroot/2018-July/225509.html

Please let me know if you have any other remarks.

Best regards,
Leon


On 8.07.2018 01:10, Arnout Vandecappelle wrote:
>  Hi Leon,
>
>  Sorry to come back with still more comments...
>
> On 05-07-18 09:58, Leon Anavi wrote:
>> Add a defconfig for the Olimex A10-OLinuXino-LIME, reusing most
>> of the A20-OLinuXino-Lime and A13-OLinuXino files.
>  Er, no, you copied those files, you didn't reuse them...
>
>  All the support files are identical or compatible with those in a20_olinuxino.
> So I think it's better to just add to that. Perhaps, for clarity, create a
> symlink from a10_olinuxino -> a20_olinuxino.
>
>  Otherwise, looks good to me. Oh, yes, one more thing: when you send a new
> version, please add a patch changelog below the --- line, and also add the
> version in the subject using the -v4 option to git format-patch. See [1].
>
>
>  Regards,
>  Arnout
>
> [1] https://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog
>
>> The configurations for Olimex A10-OLinuXino-LIME feature:
>> - U-Boot 2018.03
>> - Mainline Linux kernel 4.14.26
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>[snip]

-- 
Leon Anavi
Software Engineer
konsulko.com
