From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 14 Aug 2020 00:52:46 +0200
Subject: [Buildroot] [PATCH v2 1/5]
 support/scripts/gen-bootlin-toolchains: add new script to support Bootlin
 toolchains
In-Reply-To: <20200813220601.GN13263@scaer>
References: <20200809193818.1139805-1-thomas.petazzoni@bootlin.com>
 <20200809193818.1139805-2-thomas.petazzoni@bootlin.com>
 <20200813220601.GN13263@scaer>
Message-ID: <f1b5409b-c976-a5ce-6ea7-15541daf198b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 14/08/2020 ? 00:06, Yann E. MORIN a ?crit?:
> Thomas, All,
> 
> On 2020-08-09 21:38 +0200, Thomas Petazzoni spake thusly:
>> https://toolchains.bootlin.com/ has been providing for a few years a
>> number of ready-to-use pre-built toolchains, for a wide range of
>> architectures (which it turns out, are all built using Buildroot).
> [--SNIP--]
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> [--SNIP--]
>> diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
>> new file mode 100755
>> index 0000000000..a991797903
>> --- /dev/null
>> +++ b/support/scripts/gen-bootlin-toolchains
>> @@ -0,0 +1,475 @@
>> +#!/usr/bin/env python3
>> +
>> +import htmllistparse
> 
>     Traceback (most recent call last):
>       File "support/scripts/gen-bootlin-toolchains", line 3, in <module>
>         import htmllistparse
>     ModuleNotFoundError: No module named 'htmllistparse'
> 
> htmllistparse is not available on my distro (Ubuntu 19.10), and it is
> not even available in the latest LTS either (https://packages.ubuntu.com/htmllistparse)
> 
> Sometimes, it is not possible to install from PyPi (enterprise-grade
> machines barred from accessing Pypi for example).

Only Archlinux provide a package for htmllistparse.

https://repology.org/project/python:htmllistparse/versions

Best regards,
Romain


> 
> Regards,
> Yann E. MORIN.
> 
