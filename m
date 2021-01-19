From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 15:10:16 +0100
Subject: [Buildroot] [PATCH]
 support/config-fragments/autobuild/bootlin-x86-64-glibc: use
 toolchain-external-bootlin
In-Reply-To: <20210114224309.457805-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 14 Jan 2021 23:43:08 +0100")
References: <20210114224309.457805-1-thomas.petazzoni@bootlin.com>
Message-ID: <877do9dnlj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Until now the bootlin-x86-64-glibc was using a Bootlin toolchain as a
 > custom external toolchain. However, now that we have the
 > toolchain-external-bootlin package explicitly supporting Bootlin
 > toolchains as known toolchain profiles, it makes sense to use
 > that. Indeed, this will ensure that this autobuilder configuration
 > will use the latest available version of the Buildroot toolchain for
 > x86-64 glibc.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
