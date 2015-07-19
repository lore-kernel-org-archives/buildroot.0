From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 20:56:44 +0200
Subject: [Buildroot] [PATCH/RFC v2 02/44] package/libplatform: new
	package
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
 <1434292603-12052-3-git-send-email-bernd.kuhls@t-online.de>
 <20150614224431.00c71b0f@free-electrons.com>
Message-ID: <XnsA4DCD510FC835berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150614224431.00c71b0f at free-electrons.com:

> Dear Bernd Kuhls,
> 
> On Sun, 14 Jun 2015 16:36:01 +0200, Bernd Kuhls wrote:
> 
>> diff --git a/package/libplatform/Config.in b/package/libplatform/Config.in
>> new file mode 100644
>> index 0000000..7d275b1
>> --- /dev/null
>> +++ b/package/libplatform/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_LIBPLATFORM
>> +     bool
> 
> Any reason to not have a prompt?
> 
> Also, it probably needs C++ and threads support.

Hi,

this package was split from main Kodi source to provide common functions to 
binary addon packages, it is of no use as a standalone package, therefore I 
did not add a prompt. Packages depending on libplatform depend on c++/threads 
themselves, I thought this should be enough.

Regards, Bernd
