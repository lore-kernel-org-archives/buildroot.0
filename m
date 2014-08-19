From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 19 Aug 2014 17:59:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/bandwidthd: improve configure
 check for zlib and libusb.
In-Reply-To: <53F3511B.70104@gmail.com>
References: <1408394513-5177-1-git-send-email-romain.naour@openwide.fr>
 <53F3511B.70104@gmail.com>
Message-ID: <53F37462.8060907@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

> --- snip ---
>> +
>>
>  Thanks Romain, your help has been instrumental in getting this stuff
> fixed. Because I maintain the fork that buildroot uses in addition to
> the buildroot package, I can put these fixes in upstream without adding
> complexity to buildroot.
> 
> Could you do one last test using v2.0.1-auto-r09 as the version?
> Hopefully this solves the dependency issues and it removes the need for
> --without-x.
> 
> Thanks, Nathaniel.
> 

I redo a test with v2.0.1-auto-r09 and all reported issues are fixed.
It's great to see a maintainer very reactive :)
I confirm that --without-x is not recognized anymore.

It's sure that when a new package is added to buildroot, it is compiled with a
wide configuration possibility. It helps to detect all unhandled cases.

Best regards,
Romain
