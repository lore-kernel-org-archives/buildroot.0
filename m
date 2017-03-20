From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Mon, 20 Mar 2017 16:40:13 +0530
Subject: [Buildroot] [PATCH v2] libkcapi: new package
In-Reply-To: <20170318152040.22fcb3cd@free-electrons.com>
References: <1489741879-13900-1-git-send-email-marcin.nowakowski@imgtec.com>
 <20170318152040.22fcb3cd@free-electrons.com>
Message-ID: <c76f7f0c-31ad-7ee6-2af1-b3faab7885ef@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Saturday 18 March 2017 07:50 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 17 Mar 2017 10:11:19 +0100, Marcin Nowakowski wrote:
>> This package provides a userspace library that allows easy use of crypto
>> interfaces exposed by the kernel.
>>
>> A git tip is used instead of the last official release, as autotools
>> support and cross-compilation fixes have been added only very recently.
>>
>> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
>>
>> ---
>> v2:
>> 	Remove unnecessary AUTORECONF_OPTS
>> 	Update to latest git hash
>> 	Config: depends on ... -> if ...
>> 	Add all license files
>> ---
>>  DEVELOPERS                     |  3 +++
>>  package/Config.in              |  1 +
>>  package/libkcapi/Config.in     | 16 ++++++++++++++++
>>  package/libkcapi/libkcapi.hash |  2 ++
>>  package/libkcapi/libkcapi.mk   | 18 ++++++++++++++++++
>>  5 files changed, 40 insertions(+)
>>  create mode 100644 package/libkcapi/Config.in
>>  create mode 100644 package/libkcapi/libkcapi.hash
>>  create mode 100644 package/libkcapi/libkcapi.mk
>
> Applied to master, after doing the following changes:
>
>     [Thomas:
>      - Change sub-option prompt to "build test applications"
>      - Be more specific about the license: the library is under BSD-3c only,
>        while the programs are under BSD-3c or GPLv2.

Unless I'm missing something, library is also under BSD-3c or GPLv2. 
Almost all source files under /lib have following comment in file header.

"License: see COPYING file in root directory"

And COPYING file in root directory - says It is BSD-3c or GPLv2.


Thanks,
Rahul
