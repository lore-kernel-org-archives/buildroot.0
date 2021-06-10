From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jun 2021 17:37:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-04-11
In-Reply-To: <CAFOYHZC23wcnW0-y=fyiP2x6M2B5CEyFEzJDeWJq_Pw5BuRbkg@mail.gmail.com>
References: <6073d64f.1c69fb81.9d11e.7f35SMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZC23wcnW0-y=fyiP2x6M2B5CEyFEzJDeWJq_Pw5BuRbkg@mail.gmail.com>
Message-ID: <20210610173703.31d33d97@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Mon, 12 Apr 2021 20:37:46 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> I've managed to get the CVE updated to say "This flaw affects
> syslog-ng versions prior to and including 2.0.9"[1] but I'm still
> getting these notifications. Is there something else that needs to
> happen now? Actually nist[2] seems to know it's been modified so it
> may be a case of hurry up and wait.

If I look up at https://nvd.nist.gov/vuln/detail/CVE-2008-5110, the
list of known affected software configurations is still
cpe:2.3:a:oneidentity:syslog-ng:-:*:*:*:*:*:*:*, which means "all known
versions.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
