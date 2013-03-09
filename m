From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 22:26:41 +0100
Subject: [Buildroot] [PATCH 06/32] efl/libeet,
	efl/libevas: use host-libjpeg instead of host-jpeg
In-Reply-To: <1362687540-19440-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 21:18:34 +0100")
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362687540-19440-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y5dwz2lq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Before creating a real virtual package named 'jpeg', we want to ensure
 Thomas> that no package is using the host variant of the virtual
 Thomas> package. Instead, we make them use directly the host-libjpeg package.

Committed, thanks.

-- 
Bye, Peter Korsgaard
