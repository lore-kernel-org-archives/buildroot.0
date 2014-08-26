From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 26 Aug 2014 10:13:46 +0100
Subject: [Buildroot] [PATCH 2/3] package/libinput: fix build with
	libevdev
In-Reply-To: <53FBA434.1000401@openwide.fr>
References: <1408899186-28542-1-git-send-email-romain.naour@openwide.fr>	<1408899186-28542-2-git-send-email-romain.naour@openwide.fr>
 <20140825201244.000a638b@free-electrons.com> <53FBA434.1000401@openwide.fr>
Message-ID: <53FC4FCA.3030307@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/25/2014 10:01 PM, Romain Naour wrote:
> Hi Thomas,
>
> Le 25/08/2014 20:12, Thomas Petazzoni a ?crit :
>> Dear Romain Naour,
>>
>> On Sun, 24 Aug 2014 18:53:05 +0200, Romain Naour wrote:
>>> libevdev and libinput use the same function name (log_msg).
>>> An easy fix is to rename one of the two functions.
>>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/b1e/b1ea94f09d6f7459e3d7794c4a62bbdbb53d5da6/build-end.log
>>>
>>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>>> ---
>>>   ...put-01-rename-log_msg-to-libinput_log_msg.patch | 58 ++++++++++++++++++++++
>>>   1 file changed, 58 insertions(+)
>>>   create mode 100644 package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
>>
>> Committed, but please submit upstream.
>>
>
> I'll do.
>
> Best regards,
> Romain
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

Some changes to fix this kind of issues have been applied upstream. 
Please have a look to:

https://bugs.freedesktop.org/show_bug.cgi?id=82292

Maybe it's worth to do a version bump and check if that new patch is no 
longer necessary.

-- 
Vincent
