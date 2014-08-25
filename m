From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 25 Aug 2014 23:01:40 +0200
Subject: [Buildroot] [PATCH 2/3] package/libinput: fix build with
	libevdev
In-Reply-To: <20140825201244.000a638b@free-electrons.com>
References: <1408899186-28542-1-git-send-email-romain.naour@openwide.fr>	<1408899186-28542-2-git-send-email-romain.naour@openwide.fr>
 <20140825201244.000a638b@free-electrons.com>
Message-ID: <53FBA434.1000401@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 25/08/2014 20:12, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sun, 24 Aug 2014 18:53:05 +0200, Romain Naour wrote:
>> libevdev and libinput use the same function name (log_msg).
>> An easy fix is to rename one of the two functions.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/b1e/b1ea94f09d6f7459e3d7794c4a62bbdbb53d5da6/build-end.log
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  ...put-01-rename-log_msg-to-libinput_log_msg.patch | 58 ++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>  create mode 100644 package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
> 
> Committed, but please submit upstream.
> 

I'll do.

Best regards,
Romain
