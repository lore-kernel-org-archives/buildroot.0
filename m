From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 21:51:52 +0100
Subject: [Buildroot] [PATCH] traceroute: fix 'no rule to make target
 -lm' error
In-Reply-To: <1539902241-10211-1-git-send-email-sergio.prado@e-labworks.com>
 (Sergio Prado's message of "Thu, 18 Oct 2018 19:37:21 -0300")
References: <1539902241-10211-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <87mupw5193.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Prado <sergio.prado@e-labworks.com> writes:

 > Fix the following build error:
 > make[3]: *** No rule to make target '-lm', needed by 'traceroute'.

 > Fixes:
 > http://autobuild.buildroot.org/results/dde63672e1de1d4ba036331ab127ccc8ff044444
 > http://autobuild.buildroot.org/results/4efb67e6a29c3dd784676d30a1051f9f0c2a6c80
 > http://autobuild.buildroot.org/results/7ac23a3959aec22297695899c0f76dbbc4e114d3
 > And many more...

 > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
