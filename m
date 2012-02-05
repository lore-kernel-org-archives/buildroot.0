From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Feb 2012 11:15:03 +0100
Subject: [Buildroot] [PATCH 3/7] lttng-babeltrace: make sure WCHAR and
	LARGEFILE are enabled
In-Reply-To: <31d67f92d3e86811ef403486a84a4afb8c6257f5.1328366921.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 4 Feb 2012 15:48:44 +0100")
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <31d67f92d3e86811ef403486a84a4afb8c6257f5.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87liohsi1k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since lttng-babeltrace depends on util-linux and libglib2, we need to
 Thomas> make sure WCHAR and LARGEFILE are enabled.

Committed, thanks.

-- 
Bye, Peter Korsgaard
