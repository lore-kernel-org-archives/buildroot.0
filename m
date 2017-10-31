From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 31 Oct 2017 12:48:59 -0500
Subject: [Buildroot] [PATCH v4 1/2] package/libssh2: Update to newest
	version
In-Reply-To: <20171031173129.yqyibqxrtyoy4o2r@tarshish>
References: <1509470578-42323-1-git-send-email-sam.voss@rockwellcollins.com>
 <20171031173129.yqyibqxrtyoy4o2r@tarshish>
Message-ID: <CAH=K+6=BOtbrQ2G+vUFtS_3GdQYhhiSFkJK=YY=ZVo+i_2C9cA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On Tue, Oct 31, 2017 at 12:31 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Sam,
[...]
>
>>  # Dependency is one of mbedtls, libgcrypt or openssl, guaranteed in
>>  # Config.in. Favour mbedtls.
>> -ifeq ($(BR2_PACKAGE_MBEDTLS),y)
>> +ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
>
> Now this part belongs to the next patch.

This is embarrassing. Trying to do too many things at once.

Sam
