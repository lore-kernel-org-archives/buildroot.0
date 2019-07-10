From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Jul 2019 22:25:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: Bump to version
 s20190709
In-Reply-To: <20190709223625.4442-1-petr.vorel@gmail.com>
References: <20190709223625.4442-1-petr.vorel@gmail.com>
Message-ID: <683f00f4-a7a6-6d1e-f2b2-1bc87c706e37@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/07/2019 00:36, Petr Vorel wrote:
> Add 's' before release as this is in upstream tags and in sha256sum.asc.

 No, we want to use the _VERSION as is used on release-monitoring.org. It
doesn't have the s prefix there.

 The filename doesn't have to be identical to the one in sha256sum.asc, only the
hash has to be the same.

 I've marked as Changes Requested, so please respin.

 Thanks,
 Regards,
 Arnout

> This prevents error:
> ERROR: No hash found for iputils-20190709.tar.gz
> 
> Remove all patches (accepted in this release).
> 
[snip]
