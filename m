From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2020 10:59:10 +0200
Subject: [Buildroot] [PATCH] package/python-tinyrpc: not available for
 python 2.x
In-Reply-To: <20200929204557.28901-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 29 Sep 2020 22:45:57 +0200")
References: <20200929204557.28901-1-peter@korsgaard.com>
Message-ID: <87o8ll0zs1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/eef0969bac04800cec51fa27f1e1ecd3a4c8211e/

 > tinyrpc 1.x is not compatible with python 2.x, leading to errors during the
 > pycompile step:

 > error:   File "/usr/lib/python2.7/site-packages/tinyrpc/client.py", line 37
 >     self, protocol: RPCProtocol, transport: ClientTransport
 >                   ^
 > SyntaxError: invalid syntax

 > As also documented in the README:
 > The current version will support Python3 only.  Have a look at the 0.9.x
 > version if you need Python2 support

 > https://github.com/mbr/tinyrpc/blob/1.0.4/README.rst

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
