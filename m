From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 21:45:24 +0100
Subject: [Buildroot] [PATCH 00/44] Linux-firmware: mass addition of
 missing firmware blobs
In-Reply-To: <1486413386.2005.21.camel@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
 <20170206213414.2fc11b1f@free-electrons.com>
 <1486413386.2005.21.camel@codeblue.com>
Message-ID: <20170206214524.2351ac0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Feb 2017 20:36:26 +0000, Adam Duskett wrote:

> Is there a reason why they shouldn't be added?  If it make you more
> comfortable, I tested each entry to make sure they copy correctly.

Lots of them are never ever going to be used in the context of
Buildroot. Old sound cards, old hardware. This is just adding code that
will never be used, and we try to avoid that.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
