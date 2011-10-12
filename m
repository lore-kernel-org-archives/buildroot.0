From: Rico Bachmann <bachmann@tofwerk.com>
Date: Wed, 12 Oct 2011 12:12:29 +0200
Subject: [Buildroot] [PATCH 2/2] add libfcgi to buildroot
References: <add libfcgi to buildroot> <201110012259.10267.arnout@mind.be>
 <op.v26yjsdz705kjs@rico> <201110111806.30216.arnout@mind.be>
Message-ID: <op.v28ha3nx705kjs@rico>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 11.10.2011, 18:06 Uhr, schrieb Arnout Vandecappelle  
<arnout@mind.be>:

>
> On Tuesday 11 October 2011 16:29:42, Rico Bachmann wrote:
>> Here is the output form buildroot while using the patch:
>>
>>        >>> fcgi 2.4.0 Patching packages/fcgi
>>        for file in config.guess config.cub; do for i $(find
>> /buildroot/output/build/fcgi-2.4.0 -name $file);
>>        do cp package/gnuconfig/$file $i;
>>        done; done
>
>  Weird, you should get
>>>> fcgi 2.4.0  Updating config.sub and config.guess
> before the 'for'.
>
>  And of course, you should get
> Applying fcgi-2.4.0-add-lm.patch using plaintext:
> before that one.
>
>  That file does exist in the package/fcgi directory, right?  It's not  
> that the
> patch ended up in a completely different place?

yes the file exists in package/fcgi and has 777 rights

>
>
>  Regards,
>  Arnout
