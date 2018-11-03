From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 3 Nov 2018 12:36:02 +0100
Subject: [Buildroot] [PATCH] gcc: Don't mess with test-suite exclusion
In-Reply-To: <20181103120821.01761bd0@windsurf>
References: <20181030083124.2766-1-abrodkin@synopsys.com>
 <cdd891b6-f6b5-6963-8292-9a24916f276b@mind.be>
 <20181103120821.01761bd0@windsurf>
Message-ID: <705f8efb-9f7b-35f6-28bf-5065a0408cdd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, All,

Le 03/11/2018 ? 12:08, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Sat, 3 Nov 2018 12:00:44 +0100, Arnout Vandecappelle wrote:
> 
>>  Romain, I believe you introduced this feature. If you do think there's a good
>> reason to keep it, please send a revert.

It's fine for me as soon as the testsuite build :)

> 
> Actually, I was the one who introduced it. See
> 00e9b1e4f78633d5667b187332f36972a94b9f8b.

Indeed, I added a patch to build the toolchain without the testsuite since gcc7.

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
