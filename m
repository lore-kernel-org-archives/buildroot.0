From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:48:50 +0200
Subject: [Buildroot] [PATCH v4 6/9] package/pkg-generic: handle
 host-lzip as an extract dependency
In-Reply-To: <20180324142008.10375-7-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 24 Mar 2018 15:20:05 +0100")
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-7-thomas.petazzoni@bootlin.com>
Message-ID: <87bmfcw3z1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This moves the host-xz dependency handling from
 > DEPENDENCY_HOST_PREREQ to an extract dependency.

 > To achieve that, check-host-xz.mk fills in the

This should be check-host-lzip.mk.

> BR2_LZIP_HOST_DEPENDENCY with host-tar if building a host-tar is

and host-lzip.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
