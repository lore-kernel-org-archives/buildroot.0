From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 23:26:02 +0100
Subject: [Buildroot] [PATCH] libgtk3: mark wayland support as broken
In-Reply-To: <1448035250-17182-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 20 Nov 2015 13:00:50 -0300")
References: <1448035250-17182-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871tbdyav9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > As discussed on the list it requires a matching XDG runtime API level
 > which is currently not the case (wayland/weston newer than libgtk3 at
 > the moment). It doesn't normall exhibit build failures, but it fails at
 > runtime regardless.

 > Also fixes:
 > http://autobuild.buildroot.net/results/aae/aae4266c16189b295cc7ceb60000c504ebb60752/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
