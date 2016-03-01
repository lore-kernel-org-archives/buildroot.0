From: Stanislav Vlasic <svlasic@gmail.com>
Date: Tue, 1 Mar 2016 10:40:36 +0100
Subject: [Buildroot] [PATCH/next 03/31] package/libplatform: bump
	version, add hash
In-Reply-To: <20160229234138.70393337@free-electrons.com>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-4-git-send-email-bernd.kuhls@t-online.de>
 <20160229234138.70393337@free-electrons.com>
Message-ID: <56D56394.4070307@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 02/29/2016 11:41 PM, Thomas Petazzoni wrote:
> Dear Bernd Kuhls,
>
> On Sat, 20 Feb 2016 23:09:08 +0100, Bernd Kuhls wrote:
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>>   package/libplatform/libplatform.hash | 2 ++
>>   package/libplatform/libplatform.mk   | 2 +-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>   create mode 100644 package/libplatform/libplatform.hash
>
> Applied to next, thanks. Instead of using a Git commit ID, it would be
> good if you could use a tag. I see there has been a new tag called
> platform-2.0.1 made on January 19. Maybe this would work? If it does,
> can you send a follow-up patch?

I would just say that Kodi does have in it's own source code exact info 
on which binary addon or libplatform version to use.

E.g. 
https://github.com/xbmc/xbmc/blob/Jarvis/tools/depends/target/platform/Makefile 
says Jarvis uses version 1.0.10 which is release tag under 
https://github.com/Pulse-Eight/platform/releases.

Also, binary addons in https://github.com/xbmc/repo-binary-addons 
repository are split in branches (Jarvis branch in this case).

Each addon does have its location and branch or commit saved in file.
E.g. 
https://github.com/xbmc/repo-binary-addons/blob/Jarvis/pvr.hdhomerun/pvr.hdhomerun.txt

And as far as I can see, all binary addons are using latest commit from 
particular branch.

> Thanks!
>
> Thomas
>
