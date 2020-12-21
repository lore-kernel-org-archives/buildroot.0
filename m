From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 10:26:11 +0100
Subject: [Buildroot] [PATCH] package/opkg-utils: needs Python3 on the
 host
In-Reply-To: <20201209151551.21986-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 9 Dec 2020 16:15:50 +0100")
References: <20201209151551.21986-1-patrickdepinguin@gmail.com>
Message-ID: <87h7ofse6k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The 'opkg.py' script installed by host-opkg-utils has as shebang:
 >     #!/usr/bin/env python3

 > which may not be available on all host machines.
 > Add a potential dependency on host-python3 via BR2_PYTHON3_HOST_DEPENDENCY,
 > which will only add the host-python3 dependency if no python3 is already
 > available on the host.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
