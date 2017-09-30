From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 Sep 2017 12:59:26 +0200
Subject: [Buildroot] Build failure in icu-59.1
In-Reply-To: <15ed2440e84-c0c-47182@webjas-vaa141.srv.aolmail.net>
References: <15ed2440e84-c0c-47182@webjas-vaa141.srv.aolmail.net>
Message-ID: <2e490568-2380-4cfb-9f94-c51aabea0bed@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 30/09/2017 ? 12:10, grunpferd at netscape.net a ?crit?:
> 
> Thanks Romain,
> 
>> glibc has been updated to 2.26 recently and the xlocale.h header file has been
>> removed.
>> See https://sourceware.org/glibc/wiki/Release/2.26#Packaging_Changes
>>?
>> I tested several packages with this new version but it's difficult to test every
>> single packages.
> 
>> Can you report to the upstream project or if it's already fixed upstream, send
>> the patch to the ml?
> 
> I have have lodged bug report with ICU project. As far as I can tell it has not
> been fixed or reported.

http://bugs.icu-project.org/trac/ticket/13385

> 
> I think your analysis is correct, the advance to glibc 2.26 has flushed out this
> problem.
> How this gets fixed may depend on the ICU project that has icu 59.1 as their
> latest release.
> In the mean time buildroot might have to handle this by itself.

glibc suggest to replace xlocale.h by locale.h.
Can you send a patch doing so ?

See http://nightly.buildroot.org/manual.html#submitting-patches

Best regards,
Romain

> 
> 
> Regards,
> 
> Ross
> 
