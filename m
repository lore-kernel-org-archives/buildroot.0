From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 08 Oct 2013 22:22:15 +0200
Subject: [Buildroot] [PATCH 1 of 4] i2c-tools: add license information
In-Reply-To: <52545824.70907@mind.be>
References: <patchbomb.1381226814@argentina>
 <8d5a6b127c579be29db4.1381226815@argentina> <52545824.70907@mind.be>
Message-ID: <532f7b74-2403-49cf-8646-56bac611ed01@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote:
>On 10/08/13 12:06, Thomas De Schampheleire wrote:
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>>   package/i2c-tools/i2c-tools.mk |  2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
>> --- a/package/i2c-tools/i2c-tools.mk
>> +++ b/package/i2c-tools/i2c-tools.mk
>> @@ -7,6 +7,8 @@
>>   I2C_TOOLS_VERSION = 3.1.0
>>   I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
>>   I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
>> +I2C_TOOLS_LICENSE = GPLv2
>
>  All files are GPLv2+ AFAICS. Only py-smbus/setup.py claims that the 
>package is GPLv2, but that's just wrong.

Why is that wrong?

I reasoned that if one of the components is gplv2, and the rest is gplv2+, then the whole needs to be gplv2.

Best regards,
Thomas
