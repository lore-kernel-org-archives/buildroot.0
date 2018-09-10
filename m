From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 10 Sep 2018 23:56:51 +0200
Subject: [Buildroot] [PATCH v2] python-numpy: correct LICENSE.txt hash
 value
In-Reply-To: <20180910085618.1fe20101@windsurf.home>
References: <20180909214747.25154-1-giulio.benetti@micronovasrl.com>
 <20180910085618.1fe20101@windsurf.home>
Message-ID: <83463954-1b71-58d5-8447-445a521d80c1@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 10/09/2018 08:56, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Sun,  9 Sep 2018 23:47:47 +0200, Giulio Benetti wrote:
>> LICENSE.txt sha256 is wrong. After version bumping from 1.13.3 to 1.15.1
>> LICENSE.txt sha256 has not be re-calculated.
>>
>> New LICENSE.txt lists licenses for bundled libraries:
>> - Numpydoc -> 2-clause BSD
>> - scipy-sphinx-theme -> 3-clause BSD, PSF and Apache 2.0
>> - lapack-lite -> 3-clause BSD
>> - tempita -> BSD derived
>> - dragon4 -> specific to library, need to refer to dragon4.c file
> 
> Then, should we update the license information to list the licenses of
> the bundled libraries, or do we keep the fact that python-numpy has a
> whole is distributed under BSD-3-Clause ?

As discussed on IRC, I'm going to submit a patch to include them all 
through a patch since upstream Release lacks all sublibraries license files.

Kind regards
Giulio Benetti
