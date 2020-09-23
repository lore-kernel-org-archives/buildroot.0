From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Sep 2020 07:04:04 +0200
Subject: [Buildroot] [PATCH v3] package/python-imutils: new package
References: <20190802144503.23601-1-alexandre.payen@smile.fr>
 <20200205162013.2749e009@windsurf>
Message-ID: <4j1r3hxkiu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 05 Feb 2020 16:20:13 +0100 schrieb Thomas Petazzoni:

> If you "depends on BR2_PACKAGE_OPENCV3", there is no need to replicate
> all the dependencies of opencv3 inside this package.
> 
>> +	select BR2_PACKAGE_PYTHON_SCIPY
> 
> We don't have this package in Buildroot, this needs to be added before
> we can merge python-imutils.

Hi Thomas,

please change the patch state of http://patchwork.ozlabs.org/project/
buildroot/patch/20190802144503.23601-1-alexandre.payen at smile.fr/ to 
"Changes Requested".

Regards, Bernd
