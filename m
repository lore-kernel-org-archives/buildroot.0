From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 May 2014 22:47:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-09
In-Reply-To: <536FE087.1030103@mind.be> (Arnout Vandecappelle's message of
 "Sun, 11 May 2014 22:41:43 +0200")
References: <20140510063010.4D1F81010DF@stock.ovh.net>
 <536E86B1.4050005@mind.be> <20140511043405.GB4096@tarshish>
 <536F8C6E.1050004@mind.be> <20140511145522.GH4096@tarshish>
 <536FE087.1030103@mind.be>
Message-ID: <8738gg82lp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> How would that solve the problem? Host packages are selected directly from 
 >> Makefiles, regardless of Kconfig settings, isn't it? Or do you intend to add 
 >> host architecture dependencies to all reverse dependencies of host-protobuf 
 >> (currently: protobuf-c, protobuf, python-protobuf, and their reverse 
 >> dependencies)?

 >  Exactly. But I don't really think it's worthwhile to do that - except for the
 > autobuilder, there is probably nobody who tries building on anything except x86.

Indeed. I don't think the host-protobuf issue is something anybody will
run into in reality.

-- 
Bye, Peter Korsgaard
