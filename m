From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 23:33:25 +0100
Subject: [Buildroot] [PATCH v1 1/4] package/qt5: enable for nios2
In-Reply-To: <20200310081902.3488-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 10 Mar 2020 09:18:59 +0100")
References: <20200310081902.3488-1-ps.report@gmx.net>
Message-ID: <87v9mx2v9m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The double-conversion support for nios2 is already enabled
 > by commit [1], so drop dependency on !BR2_nios2.

 > [1] https://git.buildroot.net/buildroot/commit/?id=e2fdb41f711db8894f9c5c83f32250728d4c3aa9

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
