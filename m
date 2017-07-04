From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 15:48:59 +0200
Subject: [Buildroot] [PATCH/2017.05.x 1/1] package/imagemagick: change
	download url to github
In-Reply-To: <20170618074258.15344-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 18 Jun 2017 09:42:58 +0200")
References: <20170618074258.15344-1-bernd.kuhls@t-online.de>
Message-ID: <87fuec2tys.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Upstream quickly removes old versions from
 > http://www.imagemagick.org/download/releases

 > For our LTS versions we should switch to a stable upstream repo which
 > provides all released versions.

As upstream keeps the last x.y.z-<path> when going to z+1, I have
instead bumped 2017.02.x and 2017.05.x to the latest patch revision
(7.0.5-10) and marked these two patches as rejected in patchwork.

-- 
Bye, Peter Korsgaard
