From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 20 Apr 2018 09:37:41 +0200
Subject: [Buildroot] [PATCH] package/tk: new package
In-Reply-To: <CA+NV+V=_u1-QDROdCfe7vORZ1iUxTwqq0S+CEk-gcNE_Pr91ng@mail.gmail.com>
References: <1524133923-11881-1-git-send-email-romain.naour@smile.fr>
 <CA+NV+V=_u1-QDROdCfe7vORZ1iUxTwqq0S+CEk-gcNE_Pr91ng@mail.gmail.com>
Message-ID: <5c01cf65-7380-f72b-fdf7-2d545c1f8551@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rahul,

Le 20/04/2018 ? 08:02, Rahul Bedarkar a ?crit?:
> On Thu, Apr 19, 2018 at 4:02 PM, Romain Naour <romain.naour@smile.fr> wrote:
>> Use the same version as tcl package.
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> ---

[...]

>> diff --git a/package/tk/tk.mk b/package/tk/tk.mk
>> new file mode 100644
>> index 0000000..97c3ae6
>> --- /dev/null
>> +++ b/package/tk/tk.mk
>> @@ -0,0 +1,31 @@
>> +################################################################################
>> +#
>> +# tk
>> +#
>> +################################################################################
>> +
>> +TK_VERSION_MAJOR = 8.6
>> +TK_VERSION = $(TK_VERSION_MAJOR).6
>> +TK_SOURCE = tk$(TK_VERSION)-src.tar.gz
>> +TK_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TK_VERSION)
>> +TK_LICENSE = tcl license
> 
> SPDX short identifier for TCL/TK license is TCL. So license string
> here should be just TCL.

I copied this from tcl package. It seems tcl based package are not yet converted
to SPDX license format.

I'll fix that.

Best regards,
Romain

> 
> Thanks,
> Rahul
> 
