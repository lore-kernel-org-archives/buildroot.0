From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 09:30:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: don't remove support files
 if python chosen
In-Reply-To: <1523389042-66122-1-git-send-email-jzaddach@cisco.com> (Jonas
 Zaddach's message of "Tue, 10 Apr 2018 12:37:22 -0700")
References: <1523389042-66122-1-git-send-email-jzaddach@cisco.com>
Message-ID: <87zi1jkf44.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jonas" == Jonas Zaddach <jzaddach@sourcefire.com> writes:

 > If one wants to use GDB with python support on the target, you need the support
 > files installed by GDB. These get usually deleted to save some space, so I just
 > wrapped the Makefile code deleting them in a conditional block depending on if
 > python support is active or not.

 > Signed-off-by: Jonas Zaddach <jzaddach@cisco.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
