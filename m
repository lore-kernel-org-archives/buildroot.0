From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2020 22:06:32 +0200
Subject: [Buildroot] [PATCH v2] package/python-txtorcon.mk: drop _py3
 file for python 2.x to fix pycompile issue
In-Reply-To: <20200930191254.GQ11621@scaer> (Yann E. MORIN's message of "Wed, 
 30 Sep 2020 21:12:54 +0200")
References: <20200930073157.24001-1-peter@korsgaard.com>
 <20200930191254.GQ11621@scaer>
Message-ID: <871rijuj07.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> ../scripts/pycompile.py ..
 >> error:   File "/usr/lib/python2.7/site-packages/txtorcon/controller_py3.py", line 13
 >> async def __aenter__(self):
 >> ^
 >> SyntaxError: invalid syntax
 >> 
 >> As a workaround, simply drop the unusable _py3 file from TARGET_DIR if
 >> building for python 2.x.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Applied to master, thanks.

Thanks.

 > BTW, next time, can you update patchwork to mark the previous one as
 > superseded (or changes-requested), please? ;-]

Sure, just got sidetracked by real life stuff (tm) after sending v2.

-- 
Bye, Peter Korsgaard
