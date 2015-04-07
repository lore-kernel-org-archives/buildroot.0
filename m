From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Wed, 08 Apr 2015 00:14:22 +0200
Subject: [Buildroot] [PATCH 1/1] libvpx : bump version to 1.4.0
In-Reply-To: <20150407212903.79e0f100@free-electrons.com>
References: <1428403525-21160-1-git-send-email-sagaert.johan@proximus.be>
 <20150407212903.79e0f100@free-electrons.com>
Message-ID: <552456BE.6010306@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni schreef op 7/04/2015 om 21:29:
> Hello,
>
> On Tue,  7 Apr 2015 12:45:25 +0200, Sagaert Johan wrote:
>> no hash file needed for git repo's
>> Changes : https://chromium.googlesource.com/webm/libvpx/+/0080aca235e2d677e49ff46c3e8e77d9dd15858c/CHANGELOG
>>
>> Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
>> ---
>>   package/libvpx/libvpx.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
>> index 7624835..6a65ad3 100644
>> --- a/package/libvpx/libvpx.mk
>> +++ b/package/libvpx/libvpx.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -LIBVPX_VERSION = v1.3.0
>> +LIBVPX_VERSION = v1.4.0
>>   LIBVPX_SITE = http://git.chromium.org/webm/libvpx.git
>>   LIBVPX_SITE_METHOD = git
> As Peter Korsgaard pointed out, there is apparently a tarball available
> for this release. It would be better to use a tarball rather than
> fetching through Git when possible.
>
> Thanks,
>
> Thomas
Dear Thomas
Sure to use 
https://chromium.googlesource.com/webm/libvpx/+archive/c74bf6d889992c3cabe017ec353ca85c323107cd.tar.gz 
?
We would lose the version tag like this.
I don't see release 1.4 in the downloads : 
http://code.google.com/p/webm/downloads/list (maybe due to the 
code.google.*  service pending end ...)

Best regards , Johan
