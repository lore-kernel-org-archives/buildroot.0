From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Oct 2013 12:15:16 +0200
Subject: [Buildroot] [PATCH] opkg: add license info
In-Reply-To: <20131008121051.0844302a@skate>
References: <7a46d76755b46e4a4c18.1381226940@argentina>
 <20131008121051.0844302a@skate>
Message-ID: <CAAXf6LWDKyJwBnTfXHZVfwBkgsMvStcMybDSwudcvz==0N9K=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 8, 2013 at 12:10 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Tue, 08 Oct 2013 12:09:00 +0200, Thomas De Schampheleire wrote:
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>>  package/opkg/opkg.mk |  2 ++
>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
>> --- a/package/opkg/opkg.mk
>> +++ b/package/opkg/opkg.mk
>> @@ -13,6 +13,8 @@ OPKG_CONF_OPT = --disable-curl
>>  OPKG_AUTORECONF = YES
>>  # Uses PKG_CHECK_MODULES() in configure.ac
>>  OPKG_DEPENDENCIES = host-pkgconf
>> +OPKG_LICENSE = GPLv2+
>> +OPKG_LICENSE_FILES = COPYING
>
> There is already a patch "[PATCH] package/opkg: bumping version to
> 0.2.0" that bumps opkg and adds the license information.

Oops, didn't see this.

Thanks for mentioning, this patch can be ignored then.

Best regards,
Thomas
