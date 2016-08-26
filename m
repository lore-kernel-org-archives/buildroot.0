From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 10:56:48 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build with uClibc
In-Reply-To: <878tvkecij.fsf@dell.be.48ers.dk>
References: <1472144466-17003-1-git-send-email-rahul.bedarkar@imgtec.com>
 <878tvkecij.fsf@dell.be.48ers.dk>
Message-ID: <20160826105648.65579c15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 23:59:00 +0200, Peter Korsgaard wrote:

>  > Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>  
> 
> Committed, thanks.

And actually I had to fix up the patch, because it was not applying
properly. See
https://git.buildroot.org/buildroot/commit/?id=397962ce1737ba0f920ffc1d3a3ea2bc08b28270
for all the details.

Rahul, did you actually test the patch? It didn't apply to the domoticz
source code extracted from the tarball, causing an immediate build
failure.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
