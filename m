From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 22:52:59 +0100
Subject: [Buildroot] [V2] botan: fix static build
In-Reply-To: <1417070107-20043-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Thu, 27 Nov 2014 07:35:07 +0100")
References: <1417070107-20043-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87lhmwnwec.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > see http://autobuild.buildroot.net/results/2d1/2d1563e253b669b45c9df449c5b3a750c04a43dc/
 > this commit reverts the previous commit 84047394ed6ad08adb9f59a9022553a327eef040
 > which disables static build in Config.in

 > the option --no-autoload prevents the use of the function dlopen.

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
