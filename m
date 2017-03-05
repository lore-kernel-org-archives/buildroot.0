From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 5 Mar 2017 17:42:56 +0100
Subject: [Buildroot] [PATCH 1/9] package/lensfun: new package
In-Reply-To: <20170305163758.wasshg7tnjfmdnmq@tarshish>
References: <20170305151004.2815-1-romain.naour@gmail.com>
 <20170305163758.wasshg7tnjfmdnmq@tarshish>
Message-ID: <358621be-833f-c5b4-714b-13993530b9a0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 05/03/2017 ? 17:37, Baruch Siach a ?crit :
> Hi Romain,
> 
> On Sun, Mar 05, 2017 at 04:09:56PM +0100, Romain Naour wrote:
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Jeremy Rosen <jeremy.rosen@enst-bretagne.fr>
> 
> [...]
> 
>> diff --git a/package/lensfun/Config.in b/package/lensfun/Config.in
>> new file mode 100644
>> index 0000000..3095238
>> --- /dev/null
>> +++ b/package/lensfun/Config.in
>> @@ -0,0 +1,28 @@
>> +config BR2_PACKAGE_LENSFUN
>> +	bool "lensfun"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_USE_WCHAR # libglib2
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>> +	depends on BR2_USE_MMU # libglib2
> 
> Missing 'select BR2_PACKAGE_LIBGLIB2'.

Thanks, fixed.
I'm waiting for more review on darktable package before sending v2.

Best regards,
Romain

> 
> baruch
> 
