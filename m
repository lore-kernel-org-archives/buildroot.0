From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Fri, 21 Oct 2016 18:38:21 +0530
Subject: [Buildroot] [PATCH] libglib2: fix static linking with libgio
In-Reply-To: <20161020220429.228ec132@free-electrons.com>
References: <1476813787-9672-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20161020220429.228ec132@free-electrons.com>
Message-ID: <580A1345.6030903@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Friday 21 October 2016 01:34 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 18 Oct 2016 23:33:07 +0530, Rahul Bedarkar wrote:
>> When statically linking with libgio, application needs to link with all
>> internal libraries that libgio uses. This commit adds patch which
>> includes libmount as Libs.private.
>>
>> Fixes:
>>    http://autobuild.buildroot.net/results/fdf/fdf26abbed0014606a7788ce5d60828a0e871186
>>    http://autobuild.buildroot.net/results/1d6/1d69b8ea34cf57255be54de0c87fc83590fb1337
>>
>> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
>> ---
>>   ...o-2.0.pc-include-libmount-in-Libs.private.patch | 32 ++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>   create mode 100644 package/libglib2/0003-gio-2.0.pc-include-libmount-in-Libs.private.patch
>
> Applied to master, thanks a lot! Could you please submit the patch
> upstream?

Yes, I will submit patch upstream.

Thanks,
Rahul
