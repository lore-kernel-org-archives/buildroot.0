From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Tue, 01 Sep 2020 19:15:42 +0200
Subject: [Buildroot] [PATCH 2/4] package/python-pluggy: new package
In-Reply-To: <20200827230333.5b750a9c@windsurf.home>
References: <20200429224225.2454330-1-m.niestroj@grinn-global.com>
 <20200429224225.2454330-3-m.niestroj@grinn-global.com>
 <20200827230333.5b750a9c@windsurf.home>
Message-ID: <87o8mpju4h.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> Hello Marcin,
>
> On Thu, 30 Apr 2020 00:42:23 +0200
> Marcin Niestroj <m.niestroj@grinn-global.com> wrote:
>
>> new file mode 100644
>> index 0000000000..620983fe84
>> --- /dev/null
>> +++ b/package/python-pluggy/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_PYTHON_PLUGGY
>> +	bool "python-pluggy"
>> +	select BR2_PACKAGE_PYTHON_IMPORTLIB_METADATA # runtime
>
> I don't see this option existing in Buildroot, and your patch 1/4 in
> this series was adding the python-packaging package.

I missed that importlib-metadata package was added (most probably)
automatically by scanpypi script. It looks like we don't need this
package when using python 3.8.

I'll send v2 of this patch series with that line removed.

>
> Am I missing something here ?

Thanks for spotting that, that was my mistake.

>
> Thanks!
>
> Thomas


-- 
Marcin Niestr?j
