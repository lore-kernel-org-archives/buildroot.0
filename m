From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2015 10:03:29 +0200
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain
	w/threads
In-Reply-To: <20150401235934.58eded2d@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 1 Apr 2015 23:59:34 +0200")
References: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150401234340.1717eaf2@free-electrons.com>
 <871tk3r03i.fsf@dell.be.48ers.dk>
 <20150401235934.58eded2d@free-electrons.com>
Message-ID: <87wq1vot2m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Hmm, that indeed doesn't sound right. I think the jamvm select should be
 >> dropped from classpath.

 > There's no jamvm select in classpath, it's a 'depends on':

Yes, sorry - I meant depends on.

I'm far from a Java expert, but from what I understand it classpath is
an implementation of the Java standard libraries. You cannot really use
Java without it. To actually run Java code you need a JVM (like Jamvm),
so I think it makes sense for jamvm to select classpath and not the
other way around.

-- 
Venlig hilsen,
Peter Korsgaard 
