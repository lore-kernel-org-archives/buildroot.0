From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 15:09:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/babeltrace2: new package
In-Reply-To: <20200623200153.1112888-1-eeppeliteloop@gmail.com>
References: <20200623200153.1112888-1-eeppeliteloop@gmail.com>
Message-ID: <20200912150940.7a41b323@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Philippe,

On Tue, 23 Jun 2020 16:01:53 -0400
Philippe Proulx <eeppeliteloop@gmail.com> wrote:

> Babeltrace 2 is a trace manipulation toolkit.

> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

I have now applied your patch. First, I had to fix a number of
check-package warnings, caused by too long lines in Config.in and
Config.in.host.

The other change I did is that instead of having a suboption for the
debug info support, I simply added logic in babeltrace2.mk to enable
this feature when elfutils was enabled. I updated the Config.in help
text to indicate this optional dependency, and what additional feature
it brings.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
