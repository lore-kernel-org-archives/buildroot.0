From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2016 17:30:57 +0100
Subject: [Buildroot] [PATCH] skeleton: fix indentation of generated
	interfaces file
In-Reply-To: <1452527066-4914-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Mon, 11 Jan 2016 16:44:26 +0100")
References: <1452527066-4914-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87k2ng9iym.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > The generated $(TARGET_DIR)/etc/network/interfaces mixes spaces and
 > tabs. Fix by using tabs only.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
