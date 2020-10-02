From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2020 10:32:18 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-ugly:
 add missing comma in license variable
In-Reply-To: <20200926134452.3DD258DA2D@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 26 Sep 2020 15:54:39 +0200")
References: <20200926134452.3DD258DA2D@busybox.osuosl.org>
Message-ID: <87a6x52fl9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=4626bafe5ccd91fdcc84f2413ad23404942672f4
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > When one GPL-licensed plugin was enabled, the license of
 > gst1-plugins-ugly would be "LGPL-2.1+ GPL-2.0", but licenses should be
 > comma separated, not space separated. So let's fix that to get the
 > expected value of "LGPL-2.1+, GPL-2.0".

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
