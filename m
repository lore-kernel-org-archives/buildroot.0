From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:44:48 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-10
In-Reply-To: <20170511100207.148e4c7d@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 11 May 2017 10:02:07 +0200")
References: <20170511062842.8AC6121D45@mail.free-electrons.com>
 <20170511100207.148e4c7d@free-electrons.com>
Message-ID: <87efvqjqdr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:


 >> m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/775c81b5d0064cb196bbb367368dd76eb46ecf93 | ORPH

 > ../src/utils/ffmpeg-priv.h:111:17: error: conflicting types for 'avcodec_alloc_context3'

 > Peter (Korsgaard), you originally added this package, could you have a look ?

I did? Hmm, apparently. Looks like I added it to cleanup the linphone
package. I'll take a look.

-- 
Bye, Peter Korsgaard
