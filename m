From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Apr 2012 09:53:45 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/polarssl-hiawatha
In-Reply-To: <cover.1334073813.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 10 Apr 2012 18:05:27 +0200")
References: <cover.1334073813.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pqb9bfcm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here are two new packages, adding polarssl and hiawatha. The
 Thomas> combination of both allows to have a SSL-capable Web server in 327 KB
 Thomas> (212 KB for the polarssl shared library and 115 KB for the Hiawatha
 Thomas> web server), which is much smaller than the 1.5+ MB needed for
 Thomas> Lighttpd+OpenSSL. Those packages can therefore be an useful addition
 Thomas> on devices where space matters, and that also require a SSL-capable
 Thomas> web server.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
