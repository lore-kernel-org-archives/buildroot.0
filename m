From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 23:36:12 +0200
Subject: [Buildroot] [PATCH 5/7] package/mplayer: adjust configure
	options to updated libdvdread/libdvdnav
In-Reply-To: <1466353229-12798-5-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 19 Jun 2016 18:20:27 +0200")
References: <1466353229-12798-1-git-send-email-bernd.kuhls@t-online.de>
 <1466353229-12798-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87d1nc3lpv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This should go before the patches removing those -config scripts to not
break the build.

-- 
Bye, Peter Korsgaard
