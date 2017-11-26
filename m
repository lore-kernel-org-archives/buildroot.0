From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 20:27:19 +0100
Subject: [Buildroot] [PATCH] moarvm: use host-lua instead of host-luajit
In-Reply-To: <20171103155140.1790-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 3 Nov 2017 16:51:40 +0100")
References: <20171103155140.1790-1-peter@korsgaard.com>
Message-ID: <87indwj0x4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > host-luajit has limited architecture support, and moarvm does not need
 > anything luajit specific - So use host-lua instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
