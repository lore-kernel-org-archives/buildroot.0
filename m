From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 21 Sep 2012 00:17:47 +0200
Subject: [Buildroot] [PATCH v2 1/2] Download packages from github in
 tar.gz format instead git format.
In-Reply-To: <505B9567.3070202@mind.be>
References: <1348174101-13388-1-git-send-email-marek.belisko@open-nandra.com>
 <505B9567.3070202@mind.be>
Message-ID: <CAHXCMM+uNi4WXH0+fvHwhNV7Zs=NCH6XY0vtti4mY7dSdG3sOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/9/21 Arnout Vandecappelle <arnout@mind.be>:
> On 09/20/12 22:48, Marek Belisko wrote:
>>
>> Verified way how to get packages from github by version or sha1
>> (it's enough to use first 7 characters from SHA1):
>> 1. by sha1
>> FOO_VERSION = 1234567
>> FOO_SITE =http://github.com/user/package/tarball/branch
>>
>>
>> 2. by version
>> FOO_VERSION = v1.0
>> FOO_SITE =http://github.com/user/package/tarball/$(FOO_VERSION)
>>
>>
>> Changes from V1:
>> - remove unnecessary FOO_SOURCE from mk files and documentation
>
>
>  The changelog of the patch should go below the Signed-off-by,
> separated by a line with
> ---
> This makes sure the patch changelog is not included in the final
> git commit message.
>
>
>> Signed-off-by: Marek Belisko<marek.belisko@open-nandra.com>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Samuel Martin <s.martin49@gmail.com>


Regards,

-- 
Sam
