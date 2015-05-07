From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2015 22:22:04 +0200
Subject: [Buildroot] [PATCH] cc-tool: fix static build problem with
	boost regex
In-Reply-To: <1430861805-16232-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 May 2015 23:36:45 +0200")
References: <1430861805-16232-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <876184m93n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The boost.m4 logic is a bit crappy, and needs some help to know that
 > boost_regex needs the pthread library.

 > Fixes:

 >   http://autobuild.buildroot.org/results/69a/69aff0b9d0ac8fe08e1d2f7ffb691f6a8fc8693b/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
