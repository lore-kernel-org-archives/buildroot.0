From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Tue, 11 Jul 2017 17:25:20 -0700
Subject: [Buildroot] [PATCH 2/2] qt5: bump to 5.9.1
In-Reply-To: <1967578a-0059-d174-edcc-e62efdd0843f@mind.be>
References: <1499399077-3542-1-git-send-email-brents_3@hotmail.com>
 <DM5PR03MB2924FBF3A3BF12875E828F5BBFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
 <79ab1fe5-2dac-abde-15b0-a985b9e37959@ecagroup.com>
 <22a46dfc-6665-4a13-e5e9-5e59280cbd37@microchip.com>
 <1967578a-0059-d174-edcc-e62efdd0843f@mind.be>
Message-ID: <edc5f69f-8c3d-656d-8a21-01ecb02ed24e@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On 07/11/2017 02:16 PM, Arnout Vandecappelle wrote:
> 
> 
> On 11-07-17 02:00, Joshua Henderson wrote:
>> Julien,
>>
>> On 07/10/2017 05:02 AM, Julien CORJON wrote:
> [snip]
>>>    - 0004-examples-fix-compile-without-gui-module.patch (See 
>>> https://code.qt.io/cgit/qt/qtbase.git/commit/examples/gui/gui.pro?id=18d49808db46add078d9d4bcffaac5361d5c7269 
>>> and 
>>> https://code.qt.io/cgit/qt/qtbase.git/commit/examples/widgets/widgets.pro?id=18d49808db46add078d9d4bcffaac5361d5c7269)
>>>
>>
>> Noticed the last one is not actually upstream for 5.8 (if it matters):
>>
>>     0004-examples-fix-compile-without-gui-module.patch
>>     examples: fix compile without gui module (18d49808d).
>>
>> It only seems to be available upstream for 5.9.  Should the 5.8.0 folder
>> still be removed?
> 
>  Since the 5.8 version of qt5 is removed by this patch, indeed the entire folder
> should be removed. There is no way to use those patches any more.
> 

OK.

>  If some patch were not upstream yet in 5.9.1, then instead of removing it, it
> would have to be renamed to 5.9.1/0001-examples-fix-...

Everything is upstream for 5.9.1 that I can tell, so this step is not necessary.

I sent a patch for this change today that looks to be inline with this thread [1].
It has its own issues.

[1] https://patchwork.ozlabs.org/patch/786793/

Josh
