From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 15 Jan 2009 11:13:39 +0000
Subject: [Buildroot] error building alsa-utils
In-Reply-To: <8763khbnec.fsf@macbook.be.48ers.dk>
References: <496E4A36.4050902@carallon.com>
	<8763khbnec.fsf@macbook.be.48ers.dk>
Message-ID: <496F1A63.3010403@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Ah yes, thats fairly common. Please send the patch to the list and
> I'll apply it - Also don't forget to send it to the alsa people!

Attached is patch, have also mailed alsa-devel

> 
>  Will> The second problem I have is it appears to be trying to install
>  Will> the manual pages and is failing when trying to use xmlto
>  Will> command. I want to configure it to not build/install the man
>  Will> pages but I can't spot a configure option to do so. Am I
>  Will> missing something obvious? If not how do you suggest fixing
>  Will> this?
> 
> Well, if everything else fails, you can always patch the
> Makefile.in's.

Have fixed by patching Makefile.in. I also realise that if I had xmlto on my build machine 
it would not be a problem.

Will.


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: alsa-utils-1.0.18-fix_sysv_legacy.patch
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20090115/4bd77251/attachment.diff 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: alsa-utils-1.0.18-remove_man.patch
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20090115/4bd77251/attachment-0001.diff 
