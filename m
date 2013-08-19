From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Mon, 19 Aug 2013 16:34:47 +0200
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH=5D_strongswan=3A_fix_typo_in_tnccs?=
 =?utf-8?q?=5F20_dependencies?=
In-Reply-To: <CAAXf6LWnecW0t8Nm1Bd6KBaLjFGY0Sx8FKeP5PZZAXw5QUqP0Q@mail.gmail.com>
References: <1376907843-16135-1-git-send-email-jezz@sysmic.org>
 <CAAXf6LWnecW0t8Nm1Bd6KBaLjFGY0Sx8FKeP5PZZAXw5QUqP0Q@mail.gmail.com>
Message-ID: <eb902829aa7a977f24cf33b429adb573@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-08-19 12:53, Thomas De Schampheleire wrote:
> Hi J?r?me,
>
> On Mon, Aug 19, 2013 at 12:24 PM, J?r?me Pouiller <jezz@sysmic.org> 
> wrote:
>> It looks like there is a typing error in dependencies of tnccs_20 in 
>> strongswan
>> configure script. Add a patch to solve it.
>>
>> Resolve issues detected here:
>>     
>> http://autobuild.buildroot.net/results/b069e304c42660e7f7eba0b358f95dbaf879df64
>>     
>> http://autobuild.buildroot.net/results/7355ddbaa213f4fcfd1b6d37b25bed1aab525723
>>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>> ---
>>  ...trongswan-0002-fix-dependency-to-libtnccs.patch |   26 
>> ++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 
>> package/strongswan/strongswan-0002-fix-dependency-to-libtnccs.patch
>>
>> diff --git 
>> a/package/strongswan/strongswan-0002-fix-dependency-to-libtnccs.patch 
>> b/package/strongswan/strongswan-0002-fix-dependency-to-libtnccs.patch
>> new file mode 100644
>> index 0000000..059fc42
>> --- /dev/null
>> +++ 
>> b/package/strongswan/strongswan-0002-fix-dependency-to-libtnccs.patch
[...]
>
> Will you also send this patch upstream?
My mail has been rejected, and to be honest I am a little lazy to 
subscribe their mailing
list just for this patch.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
