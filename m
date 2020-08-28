From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 16:48:31 +0200
Subject: [Buildroot] [PATCH] package/busybox: Enable flags for use as
 systemd pager
In-Reply-To: <20200717101837.346354-1-nolange79@gmail.com> (Norbert Lange's
 message of "Fri, 17 Jul 2020 12:18:36 +0200")
References: <20200717101837.346354-1-nolange79@gmail.com>
Message-ID: <87imd2ygg0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:

 > If the less package is not enable and systemd is enabled,
 > then configure the less applet to fully work with systemd.

 > systemd sets the flags for less in an environment variable
 > and requires a few options for correct display.

 > Signed-off-by: Norbert Lange <nolange79@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
