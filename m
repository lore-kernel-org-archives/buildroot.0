From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Dec 2009 11:27:50 +0100
Subject: [Buildroot] RTNETLINK error
In-Reply-To: <20091210092953.73963a39@surf> (Thomas Petazzoni's message of
	"Thu, 10 Dec 2009 09:29:53 +0100")
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com>
	<20091210092953.73963a39@surf>
Message-ID: <87zl5runrt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Are you sure your /etc/inittab is properly configured to set-up
 Thomas> a getty or shell on whichever serial line you're using ?

 Thomas> This "ip: RTNETLINK" is something I also have, but the system
 Thomas> is fully functional. However, when I forget to adapt the
 Thomas> /etc/inittab to the board serial port configuration, I get the
 Thomas> same behaviour as you do.

My thoughts exactly. Notice that you don't need to edit inittab by hand
if you use the generic target skeleton, we have kconfig settings for
this nowadays (Target options->Generic serial port config).

-- 
Bye, Peter Korsgaard
