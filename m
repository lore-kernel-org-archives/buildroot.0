From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 May 2013 13:13:22 +0200
Subject: [Buildroot] [PATCH v3 1/7] gstreamer1: Add gstreamer version
	1.0.7 package
In-Reply-To: <20130512112313.12a809e3@skate> (Thomas Petazzoni's message of
 "Sun, 12 May 2013 11:23:13 +0200")
References: <1368158558-6069-1-git-send-email-spenser@gillilanding.com>
 <1368158558-6069-2-git-send-email-spenser@gillilanding.com>
 <518D8507.3060909@mind.be> <87k3n5yzj3.fsf@dell.be.48ers.dk>
 <20130512112313.12a809e3@skate>
Message-ID: <87bo8gzc19.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Arnout> Obviously, there will be some packages that break down when
 Arnout> gstreamer 1.0 is used, but we'll have to discover that at some
 Arnout> point anyway.

 >> Like the closed source imx stuff.

 Thomas> Hum, not sure to get your point here, though.

Well, it was late when I wrote this ;) I just meant packages like
gst-fsl-plugins probably won't work with gstreamer 1.x

-- 
Bye, Peter Korsgaard
