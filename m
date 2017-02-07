From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 14:48:31 +0100
Subject: [Buildroot] [PATCH] docs/manual: suggest 'YES' as the value for
	LIBFOO_GIT_SUBMODULES
In-Reply-To: <1486465697-30876-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Tue, 7 Feb 2017 12:08:17 +0100")
References: <1486465697-30876-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87k292ru1c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > The manual mentions LIBFOO_GIT_SUBMODULES but does not tell what value
 > it should have. The implementation only checks whether the variable is
 > non-empty, but we should suggest a specific value to avoid people
 > wondering what they have to set, and to try setting weird values.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Baruch Siach <baruch@tkos.co.il>
 > Cc: Ricardo Herrero <ricardo.herrero@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
