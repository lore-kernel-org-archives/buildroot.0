From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 07 Sep 2011 11:21:22 +0200
Subject: [Buildroot] [PATCH 1/2] Add support for package-declared devices
In-Reply-To: <201109061803.05970.arnout@mind.be>
References: <cover.1314965303.git.maxime.ripard@free-electrons.com>
 <20110905085210.705e63a0@skate> <4E64F592.8080209@free-electrons.com>
 <201109061803.05970.arnout@mind.be>
Message-ID: <4E673792.5040001@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/09/2011 18:03, Arnout Vandecappelle wrote:
> On Monday 05 September 2011 18:15:14, Maxime Ripard wrote:
>> On 05/09/2011 08:52, Thomas Petazzoni wrote:
>>> Yes, exactly. However, I don't really like the name <pkg>_DEVICE_TABLE
>>> because, it might be for other purposes as well (setting setuid bit,
>>> giving specific owner/group or permissions, etc.). Does anyone has an
>>> idea for a better name?
>>
>> I agree, I don't like it neither, but I have no idea on what could be
>> better...
>>
>> Files, maybe, but I find it way too generic.
> 
>  How about _FILE_MOD_TABLE (cfr. chmod)?

Hmm, I'm not quite sure, it is more than just mod. Maybe reuse the
"skeleton" term already in use in buildroot.

>  BTW, BR2_ROOTFS_DEVICE_TABLE the device_table.txt files should change in the 
> same way.

Of course, and in the menuconfig too.

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
