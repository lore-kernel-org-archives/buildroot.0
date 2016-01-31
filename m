From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 16:39:25 +0100
Subject: [Buildroot] [PATCH] Revert "package/openvpn: bump version to
	2.3.10"
In-Reply-To: <1454246790-8381-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 31 Jan 2016 10:26:30 -0300")
References: <1454246790-8381-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87twlthi6q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > openvpn 2.3.10 doesn't work with polarssl 1.2.x, hence this bump breaks
 > builds for the polarssl backend.

 > This reverts commit 06f3e7904f13ec08492fcc7f6e7287a90eac6347.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
