From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Dec 2016 16:17:27 +0100
Subject: [Buildroot] [PATCH] mx6: udoo: Create a mx6qdl directory for
	consistency
In-Reply-To: <1481727801-26457-1-git-send-email-fabio.estevam@nxp.com> (Fabio
 Estevam's message of "Wed, 14 Dec 2016 13:03:21 -0200")
References: <1481727801-26457-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <871sxa1qwo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <fabio.estevam@nxp.com> writes:

 > The udoo neo files are currently placed inside udoo/neo directory.
 > Place the mx6qdl udoo related files inside udoo/mx6dl for consistency.

 > Suggested-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

You forgot to update the path in the readme.txt. Committe with that
fixed, thanks.

-- 
Bye, Peter Korsgaard
