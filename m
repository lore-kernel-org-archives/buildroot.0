From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jan 2020 22:59:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-01-19
In-Reply-To: <ca76659eaf59b0903976509e6bad271bdadb5f9b.camel@impinj.com>
References: <44477.120012002221901033@us-mta-259.us.mimecast.lan>
 <ca76659eaf59b0903976509e6bad271bdadb5f9b.camel@impinj.com>
Message-ID: <20200127225950.0866e6f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello John,

On Wed, 22 Jan 2020 00:23:41 +0000
John Faith <jfaith@impinj.com> wrote:

> The 0.3.1 version of python-inflection is a python package, but the
> release-monitoring.org URL <https://github.com/jinzhu/inflection>
> https://github.com/jinzhu/inflection is a golang implementation. The
> python version is still at 0.3.1 so it doesn't seem to be outdated
> yet.

Thanks for reporting this!

I have added a separate project on release-monitoring.org,
https://release-monitoring.org/project/67637/, to track the Python
inflection module, and changed the Buildroot distro mapping so that the
Buildroot package python-inflection points to this
release-monitoring.org project.

Normally, tomorrow at 8:00 AM UTC+1, the autobuild.buildroot.org/stats/
page will be updated with the correct information, and so you should no
longer received this notification about python-inflection.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
