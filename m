From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:03:54 +0100
Subject: [Buildroot] [PATCH 1/2] package/dtc: renumber patches correctly
In-Reply-To: <20181124090403.4045-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 24 Nov 2018 10:04:02 +0100")
References: <20181124090403.4045-1-thomas.petazzoni@bootlin.com>
Message-ID: <87efb7u35h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When c7ffd8a75d55e24d793106eabbb80964ab91081f ("package/dtc: fix
 > include guards for older kernel/u-boot") introduced a new patch to the
 > dtc package, it used the 0001 number, which was already used by
 > another patch. Let's fix that.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
