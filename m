From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 17:54:05 +0100
Subject: [Buildroot] [PATCH 3/3] package/lvm2: fix udev unsupported
 option warning
In-Reply-To: <20200204141701.9881-1-p.debruijn@unilogic.nl> (Pascal de
 Bruijn's message of "Tue, 4 Feb 2020 15:17:01 +0100")
References: <20200204141701.9881-1-p.debruijn@unilogic.nl>
Message-ID: <87r1zai98y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

Extended commit message to make it clear that this is an upstream patch
and that the warning only triggers with systemd 243+ and committed,
thanks.

-- 
Bye, Peter Korsgaard
