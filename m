From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jun 2016 18:14:34 +0200
Subject: [Buildroot] [PATCH 06/24] jsmin: drop unused host variant
In-Reply-To: <20160629155653.326794ba@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 29 Jun 2016 15:56:53 +0200")
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <1467207991-4905-7-git-send-email-julien.floret@6wind.com>
 <20160629155653.326794ba@free-electrons.com>
Message-ID: <8737nwgefp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > This package (and its host variant) was added by Peter Korsgaard. I
 > guess the JS minimizer is useful on the host, when building other
 > packages, like web sites and their javascript code. Such packages are
 > generally not in Buildroot upstream, which is why we don't have a
 > dependency on host-jsmin anywhere.

 > Should we add a menuconfig entry, even though it's merely a build
 > dependency?

 > Peter?

Yes, that might be the best solution. That also makes it available for
use in E.G. a post-build script.

-- 
Venlig hilsen,
Peter Korsgaard 
