From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jan 2014 23:13:36 +0800
Subject: [Buildroot] [PATCH v2] added python unicode selection to menu
In-Reply-To: <OF20FA0FD3.D2194933-ON86257C59.004E4CE8-86257C59.004E75C7@rockwellcollins.com>
References: <1389043062-29826-1-git-send-email-mlweber1@rockwellcollins.com>
 <20140107132316.1b79f953@skate>
 <OF20FA0FD3.D2194933-ON86257C59.004E4CE8-86257C59.004E75C7@rockwellcollins.com>
Message-ID: <20140107231336.3381f187@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Tue, 7 Jan 2014 08:16:59 -0600, Matthew Weber wrote:

> > Why is the selection of UCS4 for the target tied to the usage of UCS4
> > on the host?
> 
> No specific reason, other then we couldn't come up with a case
> where you could want the host different from the target.

Normally, BR2_PACKAGE_<foo>_<bar> options are not supposed to affect
the configuration of host packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
