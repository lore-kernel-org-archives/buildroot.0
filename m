From: gregory hermant <gregory.hermant@calao-systems.com>
Date: Tue, 28 Aug 2012 08:44:17 +0200
Subject: [Buildroot] [PATCH] Add support for the HABA-KNX-LITE
In-Reply-To: <20120828024345.290a3aa0@skate>
References: <503B97EC.1000705@calao-systems.com>
 <20120828024345.290a3aa0@skate>
Message-ID: <503C68C1.7000503@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi thomas,
Thomas Petazzoni wrote:
> Le Mon, 27 Aug 2012 17:53:16 +0200,
> gregory hermant <gregory.hermant@calao-systems.com> a ?crit :
> 
>> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
>> ---
>>  .../at91bootstrap-1.16-habaknxlite.patch           |  604 +++++++++++++++
>>  .../barebox-2012.07.0-haba-knx-lite.patch          |  624 +++++++++++++++
>>  board/calao/haba-knx-lite/linux-3.4.patch          |  819 ++++++++++++++++++++
>>  configs/calao_haba_knx_lite_defconfig              |   30 +
>>  4 files changed, 2077 insertions(+), 0 deletions(-)
>>  create mode 100644 board/calao/haba-knx-lite/at91bootstrap-1.16-habaknxlite.patch
>>  create mode 100644 board/calao/haba-knx-lite/barebox-2012.07.0-haba-knx-lite.patch
>>  create mode 100644 board/calao/haba-knx-lite/linux-3.4.patch
>>  create mode 100644 configs/calao_haba_knx_lite_defconfig
> 
> Thanks.
> 
> Do you have plans to push the Barebox and Linux kernel parts upstream?
About barebox, we plan to push a patch as soon as the defaultenv-2 will be ready. 
For the kernel we are preparing a patch but for DT only.
> 
> Thomas
gregory
