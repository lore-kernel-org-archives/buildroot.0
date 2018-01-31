From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 08:51:44 +0100
Subject: [Buildroot] [PATCH] iputils: fix ping and traceroute6
 executable permissions
In-Reply-To: <1515874782-14986-1-git-send-email-tolvupostur@gmail.com>
 (tolvupostur@gmail.com's message of "Sat, 13 Jan 2018 21:19:42 +0100")
References: <1515874782-14986-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <87y3ke8nzj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "tolvupostur" == tolvupostur  <tolvupostur@gmail.com> writes:

 > From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
 > The iputils executables are installed without the setuid bit set,
 > which prevents some programs from working.

 > This patch adds a post-install hook to fix the permissions of the
 > ping and traceroute6 executables.

 > Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
