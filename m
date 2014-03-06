From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Mar 2014 23:23:47 +0100
Subject: [Buildroot] [PATCH 6/6] toolchain-external: add Linaro ARM big
	endian toolchain
In-Reply-To: <1394058220-5863-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 5 Mar 2014 23:23:40 +0100")
References: <1394058220-5863-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1394058220-5863-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877g87t18s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Linaro has started to release ARM big endian toolchains, so we
 > integrate this toolchain in the external toolchain logic of
 > Buildroot. Since ARM big endian is probably going to be a lot more
 > confidential than ARM little endian, we will only support one version

confidential? Do you mean 'specialized' or 'uncommon'?

-- 
Bye, Peter Korsgaard
