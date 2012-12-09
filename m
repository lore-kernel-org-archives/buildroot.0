From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 09 Dec 2012 16:54:00 +0100
Subject: [Buildroot] [PATCH] tslib: add license info
In-Reply-To: <50C4A9E5.9060303@mind.be>
References: <1354876163-30452-1-git-send-email-sho@relinux.de>
 <50C4A9E5.9060303@mind.be>
Message-ID: <50C4B418.6010002@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 09.12.2012 16:10, schrieb Arnout Vandecappelle:
> On 07/12/12 11:29, Stephan Hoffmann wrote:
>> Signed-off-by: Stephan Hoffmann<sho@relinux.de>
>> ---
>>   package/tslib/tslib.mk |    3 +++
>>   1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
>> index b10b5ec..9b51015 100644
>> --- a/package/tslib/tslib.mk
>> +++ b/package/tslib/tslib.mk
>> @@ -5,6 +5,9 @@
>>   #############################################################
>>   TSLIB_VERSION = 412d99d
>>   TSLIB_SITE = http://github.com/kergoth/tslib/tarball/master
>> +TSLIB_LICENSE = LGPLv2
>
>  The source files don't specify a version number. The COPYING file says:
>
> If the Library does not specify a license version number, you may
> choose any version ever published by the Free Software Foundation.
>
>
>  In other words, it's LGPL.
O.K., I wrote LGPLv2 because the author added the text of version 2. I
did not otice the cited text.

Regards

Stephan
>
>
>  Regards,
>  Arnout
>
>
>> +TSLIB_LICENSE_FILES = COPYING
>> +
>>   TSLIB_AUTORECONF = YES
>>   TSLIB_INSTALL_STAGING = YES
>>   TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR)
>> LDFLAGS=-L$(STAGING_DIR)/usr/lib install
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
