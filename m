From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 20:17:51 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/Makefile.in: add a way to
 don't force jobs in sub-make
In-Reply-To: <1379404753-3471-4-git-send-email-fabio.porcedda@gmail.com>
References: <1379404753-3471-1-git-send-email-fabio.porcedda@gmail.com>
 <1379404753-3471-4-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20130917201751.48fb34d3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

That's a minor nit, but "add a way to don't force jobs in sub-make"
isn't really correct english I blieve. "add away to not force the
number of jobs in sub-make" or something like that would be more
appropriate.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
