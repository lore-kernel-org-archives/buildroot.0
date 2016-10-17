From: Rahul Jain <rahul.jain@imgtec.com>
Date: Mon, 17 Oct 2016 15:55:26 +0530
Subject: [Buildroot] [PATCH v3 2/3] uhttpd: new package
In-Reply-To: <f1551376-9c0b-1d15-4e90-4a70a9f7b66d@imgtec.com>
References: <1476096351-29501-1-git-send-email-Rahul.Jain@imgtec.com>
 <1476096351-29501-2-git-send-email-Rahul.Jain@imgtec.com>
 <f1551376-9c0b-1d15-4e90-4a70a9f7b66d@imgtec.com>
Message-ID: <5804A716.4000408@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

Thanks for your comments.

On Friday 14 October 2016 08:20 PM, Vicente Olivert Riera wrote:
>> diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
>> new file mode 100644
>> index 0000000..b4ef291
>> --- /dev/null
>> +++ b/package/uhttpd/uhttpd.mk
>> @@ -0,0 +1,38 @@
>> +################################################################################
>>
>> +#
>> +# uhttpd
>> +#
>> +################################################################################
>>
>> +
>> +UHTTPD_VERSION = 59e0c739634f46a164d939e54416287b91ff8a9b
>> +UHTTPD_SITE = http://git.openwrt.org/project/uhttpd.git
>> +UHTTPD_SITE_METHOD = git
>> +UHTTPD_LICENSE = ISC
>
> Same thing here, UHTTPD_LICENSE_FILES is missing. You are saying that
> the license is ISC, but, how can you check it? You need some file to
> look at in order to check it.
>
The package does not provide any license file, but all the source files 
have the ISC license header. I will add one of the source file as the
license file.

Thanks,
Rahul Jain
