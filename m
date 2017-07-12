From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 11:03:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix gtk support
In-Reply-To: <20170712094924.435a5c54@windsurf.lan>
References: <20170710175137.1402-1-bernd.kuhls@t-online.de>
 <87a84asr2s.fsf@dell.be.48ers.dk>
 <20170711231701.3850d479@windsurf.lan>
 <a69e0db5-ae3c-fa51-7864-8fd8c98dd71c@mind.be>
 <20170712094924.435a5c54@windsurf.lan>
Message-ID: <20170712110354.0627faa1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jul 2017 09:49:24 +0200, Thomas Petazzoni wrote:

> Why should we randomly pass --enable-nls to some packages? Why should
> this package depends on BR2_SYSTEM_ENABLE_NLS, if it needs NLS support?

I meant to say:

==
Why *shouldn't* this package depends on BR2_SYSTEM_ENABLE_NLS, if it
needs NLS support?
==

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
