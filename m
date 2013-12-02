From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Dec 2013 08:46:22 +0100
Subject: [Buildroot] [PATCH] berkeleydb: add compat option
In-Reply-To: <1385944155-16806-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 1 Dec 2013 21:29:15 -0300")
References: <1385944155-16806-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871u1vu241.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add DB 1.85 compatibility layer option, it's needed for arpd in iproute2
 > and other old apps that haven't moved to the newer API.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
