From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Feb 2019 21:53:11 +0100
Subject: [Buildroot] [PATCH 2/2] support/config-fragments/autobuild: use
 external toolchains in RISC-V configs
In-Reply-To: <20190214103619.31068-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 14 Feb 2019 11:36:19 +0100")
References: <20190214103619.31068-1-thomas.petazzoni@bootlin.com>
 <20190214103619.31068-2-thomas.petazzoni@bootlin.com>
Message-ID: <87ef8agki0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit replaces the two RISC-V configurations used for the
 > autobuilders to use pre-built external toolchains rather than internal
 > toolchains. This saves quite a bit of build time in the autobuilders,
 > and also allows people to reproduce build issues in a much more
 > efficient, since rebuilding the toolchain is not needed.

s/efficient/efficient way/

Committed, thanks.

-- 
Bye, Peter Korsgaard
