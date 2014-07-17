From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:43:50 +0200
Subject: [Buildroot] [PATCH 1/1] Add $$(PKG)_AUTORECONF_ENV argument to
 autotools package
In-Reply-To: <38A5475DE83986499AEACD2CFAFC3F9801148D7154@tss-server1.home.tropicalstormsoftware.com>
References: <38A5475DE83986499AEACD2CFAFC3F9801148D7154@tss-server1.home.tropicalstormsoftware.com>
Message-ID: <20140717204350.6cedbf85@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rick Taylor,

On Thu, 17 Jul 2014 12:21:54 +0000, Rick Taylor wrote:

> I haven't aggressively tested it against buildroot master I'm afraid
> as we have a load of extra infrastructure around buildroot so we
> stick to full releases, and we are just evaluating 2014.05.
> 
> I shall update the docs/manual/adding-packages-autotools.txt and
> resubmit the patches.

Thanks for the explanation. However, we have received this e-mail with
a "PATCH 1/1" title even though it doesn't contain a patch, and then
the documentation update as PATCH 2/2.

In a nutshell, assuming you have a branch named "autoreconf-env" with
two patches on top of the "master" branch, what you should do to send
your patches is:

	git format-patch master

Then review the 0001-<foo>.patch and 0002-<bar>.patch to make sure
everything is in order. And then:

	git send-email --to buildroot at uclibc.org *.patch

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
