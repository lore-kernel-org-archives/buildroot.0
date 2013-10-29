From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Oct 2013 20:34:33 +0100
Subject: [Buildroot] [PATCH v3 1/1] jack2: new package
In-Reply-To: <1383072946-4851-1-git-send-email-wzab01@gmail.com>
References: <1256826d-31b9-4b85-8834-35694e372fac@email.android.com>
 <1382658143-3850-1-git-send-email-wzab01@gmail.com>
 <1382744168-14259-1-git-send-email-wzab01@gmail.com>
 <20131027181024.14201db4@skate>
 <1382903456-5996-1-git-send-email-wzab01@gmail.com>
 <20131028202748.3d03c78f@skate>
 <1383072946-4851-1-git-send-email-wzab01@gmail.com>
Message-ID: <20131029203433.563d6ced@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wojciech M. Zabolotny,

On Tue, 29 Oct 2013 19:55:45 +0100, Wojciech M. Zabolotny wrote:

> +JACK2_LICENSE = LGPLv2.1+

I didn't notice until now, but this license specification doesn't seem
to be correct. For example,
https://github.com/jackaudio/jack2/blob/master/linux/alsa/JackAlsaAdapter.cpp
is under GPLv2+. Parts of jack2 seem to be under LGPL, some other parts
under GPL. It should be explained in the <pkg>_LICENSE specification,
with something just as (purely invented example, I haven't analyzed
jack2) :

FOO_LICENSE = GPLv2+ (this part and this part), LGPLv2.1+ (this other part)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
