From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 15:06:39 +0100
Subject: [Buildroot] [PATCH v2 3/3] pru-sample: add sample PRU
 application
In-Reply-To: <1a270629-34f9-06f6-fb58-25455e61900d@mind.be>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480096200-20475-3-git-send-email-ash.charles@savoirfairelinux.com>
 <1a270629-34f9-06f6-fb58-25455e61900d@mind.be>
Message-ID: <20161126150639.1979e9c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Nov 2016 12:22:36 +0100, Arnout Vandecappelle wrote:

>  Obviously, only 1 firmware binary can be installed. So you have the following
> options:
> - Support only one example.
> - Add config options for all the examples and let the user select it.
> - Install examples, but not as am335x-pru0-fw, but in a pru-examples
> subdirectory, leaving it up to the user to copy/link it to the correct name for
> firmware loading. Mention in the help text how to do that.
> 
>  I'm in favour of the last option. Among other things, it makes it easier to
> support other SoCs than the AM335x.

Agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
