From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Feb 2011 18:22:53 +0100
Subject: [Buildroot] [PATCH 1/1] qt: move host programs and specs in
	HOST_DIR
In-Reply-To: <fc21c0b4bcdd6d940a323c5d394d1e285aa3ec4e.1297099060.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 7 Feb 2011 18:18:00 +0100")
References: <cover.1297099060.git.thomas.petazzoni@free-electrons.com>
	<cover.1297099060.git.thomas.petazzoni@free-electrons.com>
	<fc21c0b4bcdd6d940a323c5d394d1e285aa3ec4e.1297099060.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87oc6nvjwy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The Qt build system installs all host programs (uic, rcc, moc, qmake,
 Thomas> etc.) in the same base directory as the headers and libraries, but
 Thomas> that's not great for Buildroot.

 Thomas> So we now move the host programs and the mkspecs files to the
 Thomas> $(HOST_DIR), and create a qt.conf, which tells qmake where everything
 Thomas> is located.

 Thomas> Tested with Qmake and Cmake as build system for a simple Qt
 Thomas> application.

Committed, thanks.

-- 
Bye, Peter Korsgaard
