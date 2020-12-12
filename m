From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Dec 2020 12:04:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11vnc: fix CVE-2020-29074
In-Reply-To: <20201203201013.585769-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 3 Dec 2020 21:10:13 +0100")
References: <20201203201013.585769-1-fontaine.fabrice@gmail.com>
Message-ID: <87sg8bnv43.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > scan.c in x11vnc 0.9.16 uses IPC_CREAT|0777 in shmget calls, which
 > allows access by actors other than the current user.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
