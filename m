From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 05 Sep 2011 18:15:14 +0200
Subject: [Buildroot] [PATCH 1/2] Add support for package-declared devices
In-Reply-To: <20110905085210.705e63a0@skate>
References: <cover.1314965303.git.maxime.ripard@free-electrons.com>
 <4aaac08b6012188f28e05ee700f9be550b40dde4.1314965303.git.maxime.ripard@free-electrons.com>
 <201109042336.44526.arnout@mind.be> <20110905085210.705e63a0@skate>
Message-ID: <4E64F592.8080209@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 05/09/2011 08:52, Thomas Petazzoni wrote:
> Hello,
> 
> Le Sun, 4 Sep 2011 23:36:43 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> 
>>  Good idea!  This will also make it possible to create setuid
>> executables.
> 
> Yes, exactly. However, I don't really like the name <pkg>_DEVICE_TABLE
> because, it might be for other purposes as well (setting setuid bit,
> giving specific owner/group or permissions, etc.). Does anyone has an
> idea for a better name?

I agree, I don't like it neither, but I have no idea on what could be
better...

Files, maybe, but I find it way too generic.

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
