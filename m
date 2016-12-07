From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 7 Dec 2016 15:39:26 -0800
Subject: [Buildroot] [PATCH 2/2] package/xen: Disable strict
	unused-const-variable checking
In-Reply-To: <20161207215039.1accb7ba@free-electrons.com>
References: <1481140097-32096-1-git-send-email-alistair.francis@xilinx.com>
 <1481140097-32096-3-git-send-email-alistair.francis@xilinx.com>
 <20161207215039.1accb7ba@free-electrons.com>
Message-ID: <CAKmqyKM0RTciLxjAkJ5DnZsq9yON3Er9XdwXMpd9E-CpQqsAYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 7, 2016 at 12:50 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 7 Dec 2016 11:48:17 -0800, Alistair Francis wrote:
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>
> What is this patch fixing? The commit log shouldn't be empty.
>
> Is this fixing an autobuilder issue? If so, there should be a reference
> to it.

It is fixing an autobuilder issue, I have added a commit message with
more details.

>
>> ---
>>  ...-Disable-strtict-unused-const-variable-ch.patch | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 package/xen/0003-tools-libxl-Disable-strtict-unused-const-variable-ch.patch
>>
>> diff --git a/package/xen/0003-tools-libxl-Disable-strtict-unused-const-variable-ch.patch b/package/xen/0003-tools-libxl-Disable-strtict-unused-const-variable-ch.patch
>> new file mode 100644
>> index 0000000..2bca456
>> --- /dev/null
>> +++ b/package/xen/0003-tools-libxl-Disable-strtict-unused-const-variable-ch.patch
>> @@ -0,0 +1,27 @@
>> +From 3215099e9db9716dfade78880adb169bd7866192 Mon Sep 17 00:00:00 2001
>> +From: Alistair Francis <alistair.francis@xilinx.com>
>> +Date: Wed, 7 Dec 2016 11:35:10 -0800
>> +Subject: [PATCH] tools/libxl: Disable strtict unused-const-variable checking
>
> Typo in the tittle: strtict -> strict.

Good catch, fixed in v2.

Thanks,

Alistair

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
