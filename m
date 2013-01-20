From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 19:33:42 +0100
Subject: [Buildroot] [PATCH] wireless_tools: don't call ldconfig
In-Reply-To: <1358700724-9418-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 20 Jan 2013 17:52:04 +0100")
References: <1358700724-9418-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87obgjembd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The wireless_tools installation process calls ldconfig to update the
 Thomas> ld.so cache, but in a cross-compilation situation, it doesn't make
 Thomas> sense, and simply takes time for nothing. To avoid this, we pass
 Thomas> LDCONFIG=/bin/true during the wireless_tools installation steps.

Committed, thanks.

-- 
Bye, Peter Korsgaard
