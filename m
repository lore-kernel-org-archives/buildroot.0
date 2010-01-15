From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Jan 2010 22:40:04 +0100
Subject: [Buildroot] [git commit master] qt: ensure libglib2 is built
	before qt if enabled for Qt's glib support
In-Reply-To: <1263587737.5454.12.camel@coalu.atr> (Lionel Landwerlin's message
	of "Fri, 15 Jan 2010 21:35:37 +0100")
References: <20100115134832.702BA776C0@busybox.osuosl.org>
	<1263587737.5454.12.camel@coalu.atr>
Message-ID: <87d41boxmz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

Hi,

 Lionel> Hi Peter,

 Lionel> There is also an option in the Qt configuration for glib
 Lionel> integration. It would be nice to have access to it through
 Lionel> KConfig.

Do you mean something to force the glib dependency or something to not
enable the glib support even though the user has enabled glib?

We typically don't have user selectable configs for those kind of stuff
(X support, glib, ..) to keep the amount of settings to a sane number.

-- 
Bye, Peter Korsgaard
