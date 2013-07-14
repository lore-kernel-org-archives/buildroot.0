From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Jul 2013 22:33:22 +0200
Subject: [Buildroot] [PATCHv2 11/25] package/uClibc: drop ARM EABI
	conditions
In-Reply-To: <1373754468-7527-12-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 14 Jul 2013 00:27:34 +0200")
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373754468-7527-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9loc25p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Thomas> ... since we now only support EABI for ARM, we only need to
 Thomas> force EABI unconditionally.

 Thomas> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Thomas> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

And this should probably have been together with patch 5, but ok -
Committed, thanks.

-- 
Bye, Peter Korsgaard
