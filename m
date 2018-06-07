From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 08:02:36 +0200
Subject: [Buildroot] [PATCH v4 1/1] flatcc: new package
In-Reply-To: <1527786269-11147-1-git-send-email-joel.carlson@cosmicaes.com>
References: <1527786269-11147-1-git-send-email-joel.carlson@cosmicaes.com>
Message-ID: <20180607080236.14fff0db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 May 2018 11:04:29 -0600, Joel Carlson wrote:
> This adds flatcc as a new package, pulling v0.5.1 from github. flatcc
> has both a host tool (the compiler), and libraries for the target.
> 
> Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
> Signed-off-by: Joel Carlson <joel.carlson@cosmicaes.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

This package fails to build on machines with gcc 8.x:

  http://autobuild.buildroot.net/results/8aa/8aa326212dc59ce88d6b5461cb196473f47b56a0/build-end.log

Could you have a look and send a patch to fix this problem ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
