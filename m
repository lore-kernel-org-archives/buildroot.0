From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 Aug 2018 20:29:34 +0200
Subject: [Buildroot] [PATCH next] libyaml: fix libyaml-legal-info build
 failure
In-Reply-To: <87zhx5vxpk.fsf@tkos.co.il>
References: <20180829173320.66826-1-giulio.benetti@micronovasrl.com>
 <87zhx5vxpk.fsf@tkos.co.il>
Message-ID: <07d91759-9284-a1e3-4c8f-536cae1705c5@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Il 29/08/2018 20:23, Baruch Siach ha scritto:
> Hi Giulio,
> 
> Giulio Benetti writes:
>> LICENSE file hash is wrong, this leads to libyaml-legal-info build
>> failure. This is probably due to version bump.
> 
> What are the changes in the LICENSE file in this version bump? Does it
> affect the license? Please mention these details in the commit log.

Ah right, if hash changed, file changed.
Basically they've updated copyright, I'm going to send v2 patch with 
this in commit log.

Thank you
Giulio
