From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Oct 2019 23:32:22 +0200
Subject: [Buildroot] [PATCH] package/util-linux: Add option for enabling
 wipefs
References: <20191018033047.370820-1-sam.voss@gmail.com>
 <98c40882-8f1d-61d6-41fa-74d86a8bf5a8@mind.be>
Message-ID: <XnsAAEDEF2F2845berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote in
news:98c40882-8f1d-61d6-41fa-74d86a8bf5a8 at mind.be: 

> On 18/10/2019 05:30, sam.voss at gmail.com
> wrote: 
>> From: Sam Voss <sam.voss@gmail.com>
>> 
>> Add option to enable wipefs as a standalone app, so that it may be
>> enabled when the flag --disable-all-packages is set.
>> 
>> Signed-off-by: Sam Voss
>> <sam.voss@gmail.com> 
> 
>  Applied to master, thanks.

Hi,

this patch lacks

    	UTIL_LINUX_AUTORECONF = yes

causing build errors:
http://autobuild.buildroot.net/?reason=util-linux-2.34

Regards, Bernd
