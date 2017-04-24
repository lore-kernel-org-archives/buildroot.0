From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:30:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: disable cuda support
In-Reply-To: <20170416121236.24706-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 16 Apr 2017 14:12:36 +0200")
References: <20170416121236.24706-1-bernd.kuhls@t-online.de>
Message-ID: <87bmrlvc1t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > mpv wrongly detects cuda being available:
 > Checking for CUDA hwaccel : yes

 > leading to build errors.

 > Fixes
 > http://autobuild.buildroot.net/results/e89/e892a537265ad7259024403a0bb3ca5da85ed096/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
