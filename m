From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Apr 2014 11:05:55 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-19
In-Reply-To: <435816036.13835416.1398243362765.JavaMail.root@openwide.fr>
References: <53577F04.1040409@mind.be>
 <435816036.13835416.1398243362765.JavaMail.root@openwide.fr>
Message-ID: <20140423110555.60b6da2d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Wed, 23 Apr 2014 10:56:02 +0200 (CEST), Jeremy Rosen wrote:

> on a side note, if the autobuilder has selected a high number of packages
> so far, there are probably many "low number of packages" type of bug
> that it could find. it might be interesting to temporarly set it to a
> low number of packages...

As I said, the randomization is randomized. The percentage used for
KCONFIG_PROBABILITY is itself randomized between 1% and 30%. So some
builds will have 1% of BR2_PACKAGE_<foo> options enabled, some will
have 30% of options defined.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
