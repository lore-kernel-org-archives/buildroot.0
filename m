From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2016 07:49:39 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: Rename /etc/profile.d/umask
	to umask.sh
In-Reply-To: <1454946165-8192-1-git-send-email-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Mon, 8 Feb 2016 16:42:45 +0100")
References: <1454946165-8192-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <877fidt5z0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > /etc/profile only sources files that matches the /etc/profile.d/*.sh
 > pattern, so /etc/profile.d/umask was never sourced.

 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
