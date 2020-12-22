From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:51:31 +0100
Subject: [Buildroot] [PATCH] package/opkg-utils: needs Python3 on the
 host
In-Reply-To: <20201209151551.21986-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 9 Dec 2020 16:15:50 +0100")
References: <20201209151551.21986-1-patrickdepinguin@gmail.com>
Message-ID: <87o8imktak.fsf@dell.be.48ers.dk>
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

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
