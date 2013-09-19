From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 18:11:50 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: new package
In-Reply-To: <OF952C3494.90E0D391-ON86257BEB.00528672-86257BEB.0052A01A@rockwellcollins.com>
References: <1379533013-13209-1-git-send-email-mlweber1@rockwellcollins.com>
 <523A2AEE.4070606@mind.be>
 <OF635D0B64.199C14BF-ON86257BEB.000D9C69-86257BEB.004AD41E@rockwellcollins.com>
 <523AFFFA.7020809@mind.be> <20130919165917.021f2bd4@skate>
 <OF952C3494.90E0D391-ON86257BEB.00528672-86257BEB.0052A01A@rockwellcollins.com>
Message-ID: <20130919181150.107b3285@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Sep 2013 10:02:28 -0500, mlweber1 at rockwellcollins.com wrote:

> Yeah, only for IPv6 doing a md5 sum.  What's the cleanest way to comment 
> that in the Config.in?  Part of the description?

Just:

	# IPv6 support needs to do a MD5 sum for <some reason>
	select BR2_PACKAGE_OPENSSL if BR2_INET_IPV6

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
