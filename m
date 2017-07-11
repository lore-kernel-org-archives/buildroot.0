From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Jul 2017 23:16:42 +0200
Subject: [Buildroot] [PATCH 2/2] qt5: bump to 5.9.1
In-Reply-To: <22a46dfc-6665-4a13-e5e9-5e59280cbd37@microchip.com>
References: <1499399077-3542-1-git-send-email-brents_3@hotmail.com>
 <DM5PR03MB2924FBF3A3BF12875E828F5BBFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
 <79ab1fe5-2dac-abde-15b0-a985b9e37959@ecagroup.com>
 <22a46dfc-6665-4a13-e5e9-5e59280cbd37@microchip.com>
Message-ID: <1967578a-0059-d174-edcc-e62efdd0843f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-07-17 02:00, Joshua Henderson wrote:
> Julien,
> 
> On 07/10/2017 05:02 AM, Julien CORJON wrote:
[snip]
>>    - 0004-examples-fix-compile-without-gui-module.patch (See 
>> https://code.qt.io/cgit/qt/qtbase.git/commit/examples/gui/gui.pro?id=18d49808db46add078d9d4bcffaac5361d5c7269 
>> and 
>> https://code.qt.io/cgit/qt/qtbase.git/commit/examples/widgets/widgets.pro?id=18d49808db46add078d9d4bcffaac5361d5c7269)
>>
> 
> Noticed the last one is not actually upstream for 5.8 (if it matters):
> 
>     0004-examples-fix-compile-without-gui-module.patch
>     examples: fix compile without gui module (18d49808d).
> 
> It only seems to be available upstream for 5.9.  Should the 5.8.0 folder
> still be removed?

 Since the 5.8 version of qt5 is removed by this patch, indeed the entire folder
should be removed. There is no way to use those patches any more.

 If some patch were not upstream yet in 5.9.1, then instead of removing it, it
would have to be renamed to 5.9.1/0001-examples-fix-...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
