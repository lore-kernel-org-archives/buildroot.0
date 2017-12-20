From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 20 Dec 2017 14:35:27 +0530
Subject: [Buildroot] [PATCH v5 00/11] board: Add Allwinner A64/H5 boards
In-Reply-To: <20171219204807.io5y3giwu3bpptxg@speedy.hunter>
References: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
 <20171219204807.io5y3giwu3bpptxg@speedy.hunter>
Message-ID: <CAMty3ZCQq0-1CZV8fOEz1LnaXe2M9AfGwYTOvq3rsYUbHCMNKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 20, 2017 at 2:18 AM, Sergey Matyukevich <geomatsi@gmail.com> wrote:
> Hello Jagan,
>
>> All boards now use Mainline U-Boot, Linux and Nanaopi A64, A64-olinuxino
>> used linux-next patches since 4.13.7 have not been merged.
>>
>> Tested on rea hardware.
>>
>> Changes for v5:
>> - Fixed wiki links
>> - Update dtb file for sopine
>> Changes for v4:
>> - Added "arm-trusted-firmware: Build FIP for BL33" patch
>> - Added "uboot: Add U-Boot-bundles-ATF support" patch
>> - Droped sunxi64-post-build.sh config and script file
>> Changes for v3:
>> - Fixed Bananapi M1 comment on config file
>> - Add sunxi64-post-build.sh
>> - Add all sunxi64 boards
>> Changes for v2:
>> - Rebase on master
>>
>> [1] http://buildroot-busybox.2317881.n4.nabble.com/PATCH-v4-00-11-board-Add-Allwinner-A64-H5-boards-td178509.html
>>
>> Jagan Teki (11):
>>   arm-trusted-firmware: Build FIP for BL33
>>   uboot: Add U-Boot-bundles-ATF support
>>   board: Add Bananapi M64 support
>>   board: Add Pine64 support
>>   board: Add SoPine support
>>   board: Add FriendlyARM Nanopi A64 support
>>   board: Add FriendlyARM Nanopi NEO2 support
>>   board: Add Olimex A64-OLinuXino support
>>   board: Add Orangepi Win/Win Plus support
>>   board: Add Orangepi Prime support
>>   board: Add Orangepi Zero Plus2 support
>
> All the ATF changes has been submitted by Thomas. So it should be ok to submit
> support for all these boards. Do you plan to do so any time soon ? Let me know
> if you are busy with other tasks at the moment. Then I would re-submit a part
> of this patchset related to Orange Pi Zero Plus2 (keeping your authorship)
> and adding WiFi support on top.

I'm in between with rebase and respective changes, will send it soon
and copy you as well, thanks!
