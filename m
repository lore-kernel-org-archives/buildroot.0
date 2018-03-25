From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:45:42 +0200
Subject: [Buildroot] [PATCH v4 5/9] package/pkg-generic: handle host-xz
 as an extract dependency
In-Reply-To: <20180324142008.10375-6-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 24 Mar 2018 15:20:04 +0100")
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-6-thomas.petazzoni@bootlin.com>
Message-ID: <87fu4ow449.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This moves the host-xz dependency handling from
 > DEPENDENCY_HOST_PREREQ to an extract dependency.

 > To achieve that, check-host-xz.mk fills in the
 > BR2_XZ_HOST_DEPENDENCY with host-tar if building a host-tar is

Cut'n'paste? ;)

Both of these host-tar references should be host-xz.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
