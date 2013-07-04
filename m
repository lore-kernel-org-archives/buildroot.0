From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Jul 2013 09:07:35 +0200
Subject: [Buildroot] [PATCH 16/23] Remove TOOLCHAIN_DIR
In-Reply-To: <1372620553-11416-17-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:29:06 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-17-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y59mn6q0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The $(O)/toolchain directory, also called $(TOOLCHAIN_DIR) is no
 Thomas> longer needed, as all packages are now built in $(O)/build/, including
 Thomas> gcc and uClibc.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
