From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jan 2016 23:17:03 +0100
Subject: [Buildroot] [PATCH 1/1] disable reboot by ctrl-alt-del
In-Reply-To: <1451858433-7932-1-git-send-email-felten@vaxnet.de> (lothar
 felten's message of "Sun, 3 Jan 2016 23:00:33 +0100")
References: <1451858433-7932-1-git-send-email-felten@vaxnet.de>
Message-ID: <87d1til34w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "lothar" == lothar felten <felten@vaxnet.de> writes:

 > From: lf <micro1183@gmail.com>
 
 > Most embedded systems do not have a keyboard.
 > If a keyboard is attached afterwards (e.g. to an accessible USB host port) 
 > this allows the user to reboot the system by pressing Ctrl-Alt-Del, which
 > might not be desired.
 
 > Signed-off-by: lothar felten <felten@vaxnet.de>

Committed with the authorship fixed, thanks.

-- 
Bye, Peter Korsgaard
