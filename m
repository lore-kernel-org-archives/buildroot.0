From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Date: Wed, 30 Mar 2016 20:39:26 +0530
Subject: [Buildroot] [PATCH v2] powerpc-utils: Bump powerpc-utils to
 v1.3.1
In-Reply-To: <20160330164805.740a1e6b@free-electrons.com>
References: <20160330054905.13012.58031.stgit@hegdevasant.in.ibm.com>
 <20160330164805.740a1e6b@free-electrons.com>
Message-ID: <56FBEC26.2030807@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/30/2016 08:18 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 30 Mar 2016 11:20:38 +0530, Vasant Hegde wrote:
>
>> diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
>> deleted file mode 100644
>> index d02f16a..0000000
>> --- a/package/powerpc-utils/powerpc-utils.hash
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -# From http://sourceforge.net/projects/powerpc-utils/files/powerpc-utils/
>> -sha1	975c668e8eaedd5222a7870e82ce295d06dfe649	powerpc-utils-1.2.24.tar.gz
>> -md5	f492a72f2d4522eba5d9b329c84b3ed3	powerpc-utils-1.2.24.tar.gz
>
> You shouldn't have removed the hash file, so I've re-added one with the
> correct sha256 hash for the new version.

Sorry for that.

>
>> +POWERPC_UTILS_LICENSE = GPLv2
>
> This is not correct, the license is GPLv2+.
>
> I've applied after fixing those two issues, plus tweaking a bit the
> commit title.

Changes looks good. Thanks for fixing locally.

-Vasant
