From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun, 9 Sep 2018 23:37:11 +0200
Subject: [Buildroot] [PATCH] python-numpy: correct LICENSE.txt hash value
In-Reply-To: <20180909233014.1e73e8aa@windsurf.home>
References: <20180909203645.126755-1-giulio.benetti@micronovasrl.com>
 <20180909233014.1e73e8aa@windsurf.home>
Message-ID: <09042c21-689f-c98e-8d46-fa1630e4cd33@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 09/09/2018 23:30, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Sun,  9 Sep 2018 22:36:45 +0200, Giulio Benetti wrote:
>> LICENSE.txt sha256 is wrong. After version bumping from 1.13.3 to 1.15.1
>> LICENSE.txt sha256 has not be re-calculated.
>>
>> Update sha256 recalculating it locally.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/08e/08e1121af151c65b2333e06839256eb13f4ad800//
>> http://autobuild.buildroot.net/results/9d0/9d0e557c5946b76aa4c8c87b7616433c16b61e20//
> 
> What are the changes between the old and new license files ? Blinding
> changing the hashes completely defeats the point of having hashes for
> license files.

Sorry, you've already pointed me this few days ago.
I resubmit with description.

Best regards
Giulio Benetti
