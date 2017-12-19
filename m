From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 18 Dec 2017 23:57:42 -0200
Subject: [Buildroot] [PATCH] utils/checkpackagelib: exclude two files
 from Config.in indentation check
References: <20171218220344.GC2903@scaer>
Message-ID: <5a3872168413e_bd03fa7729df43c853dd@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Dec 18, 2017 at 08:03 PM, Yann E. MORIN wrote:

> On 2017-12-18 09:43 +0100, Thomas Petazzoni spake thusly:
>> package/x11r7/Config.in and package/kodi/Config.in do not comply with
>> the normal Config.in indentation rules. However, this violation of the
>> rule is legitimate, so let's skip them in check-package for this
>> specific indentation check.
> 
> Can't we simply fix those two files to not have that unusual indentation
> in the first place?
> 
> AFAICS, that special indentation is about the 'source' lines... Surely
> that does not bring much to have them indented, and they could simply be
> left-aligned...

Makes sense to me.
Let's include the developers for those 2 files to see if they have arguments to
keep or change.

Regards,
Ricardo
