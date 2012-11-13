From: =?ISO-8859-1?Q?Gr=E9gory_Hermant?= <gregory.hermant@calao-systems.com>
Date: Tue, 13 Nov 2012 12:03:21 +0100
Subject: [Buildroot] [PATCH v2 3/6] Add board files for snowball
In-Reply-To: <20121112193716.54622654@skate>
References: <1352742102-19010-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352742102-19010-4-git-send-email-gregory.hermant@calao-systems.com>
 <20121112193716.54622654@skate>
Message-ID: <50A228F9.20605@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 12/11/2012 19:37, Thomas Petazzoni a ?crit :
> Dear Gregory Hermant,
> 
> On Mon, 12 Nov 2012 18:41:39 +0100, Gregory Hermant wrote:
>>
>> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
>> ---
>>  board/calao/snowball/busybox-1.20.x.config | 1024 ++++++++++++++++++++++++++++
> 
> Is there a specific reason to have a custom Busybox configuration file?

Enable the firmware loading (mdev).

> 
> Thanks,
> 
> Thomas
> 
gregory
