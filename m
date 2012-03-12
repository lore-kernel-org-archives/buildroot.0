From: Eric Jarrige <eric.jarrige@armadeus.org>
Date: Tue, 13 Mar 2012 00:13:53 +0100
Subject: [Buildroot] [PATCH] Add (Freescale) elftosb host package
In-Reply-To: <20120312183241.56f78a30@skate>
References: <1331560507-12444-1-git-send-email-eric.jarrige@armadeus.org>
 <20120312183241.56f78a30@skate>
Message-ID: <73E430A1-7C75-4E82-9A74-5771BC39AB48@armadeus.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 12 mars 2012, at 18:32, Thomas Petazzoni wrote:

> Hello Eric,
> 
> Thanks for this patch. See comments below.
> 
> Le Mon, 12 Mar 2012 14:55:07 +0100,
> Eric Jarrige <eric.jarrige@armadeus.org> a ?crit :
> 
>> diff --git a/package/elftosb/elftosb10.12.01-fixes_includes.patch b/package/elftosb/elftosb10.12.01-fixes_includes.patch
>> new file mode 100644
>> index 0000000..5e31233
>> --- /dev/null
>> +++ b/package/elftosb/elftosb10.12.01-fixes_includes.patch
> 
> This patch should include a description and a Signed-off-by line.

Correct, I will fix it.

> 
> 
> Moreover, who is using this host-elftosb package at the moment? Do you
> intend to send some further package to the linux package to make use of
> it? Or should this package be presented to the user in the "Host
> utilities" submenu?

I have the plan to send another patch to support the u-boot.sb binary file
format that will depend on this host tool. 
The new apf28 board will also use this .sb binary file format and the elftosb
tool. It also possible to package the linux kernel with this tool for some CPUs
but for the time being that is not in my plan.
I do not know if this can be useful to have it in a user submenu.

Thanks for your response.

Best regards,
Eric


 
