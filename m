From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 21:23:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add option for
 static client
In-Reply-To: <1476850246-12883-1-git-send-email-christian@paral.in>
References: <1476850246-12883-1-git-send-email-christian@paral.in>
Message-ID: <20170307212311.14c4fbb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 00:10:46 -0400, Christian Stewart wrote:
> Adds an option to selectively enable a static client.
> 
> This is useful when bind-mounting the docker client binary into
> containers for a docker-in-docker setup.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Since there hasn't been much opposition to your patch, I want to merge
it. Could you however send an updated version that applies to the
latest master, and with an improved commit log and Config.in help text,
based on the justification you gave to Peter?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
