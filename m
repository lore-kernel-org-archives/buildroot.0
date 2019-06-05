From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Jun 2019 23:01:31 +0200
Subject: [Buildroot] [PATCH 2/2] package/netsurf: do not allow on static
 linking configurations
In-Reply-To: <20190509202808.6741-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 9 May 2019 22:28:08 +0200")
References: <20190509202808.6741-1-thomas.petazzoni@bootlin.com>
 <20190509202808.6741-3-thomas.petazzoni@bootlin.com>
Message-ID: <87blzbyces.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Static linking does not work properly in netsurf, nobody fixed it, and
 > the netsurf build system is completely broken. Let's disable the
 > package for static linking configurations.

 > Fixes:

 >   http://autobuild.buildroot.net/results/28b43c29e241080e23c87145797ea00dc4b3970d/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
