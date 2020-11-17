From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 21:21:09 +0100
Subject: [Buildroot] [PATCH] package/modem-manager: bump to version
 1.14.8
In-Reply-To: <20201116094439.137637-1-aleksander@aleksander.es> (Aleksander
 Morgado's message of "Mon, 16 Nov 2020 10:44:39 +0100")
References: <20201116094439.137637-1-aleksander@aleksander.es>
Message-ID: <87361720qy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Aleksander" == Aleksander Morgado <aleksander@aleksander.es> writes:

 > There should be no longer any need for the ac_cv_prog_XSLTPROC_CHECK
 > hack, this release already removes xsltproc from being a build
 > dependency when building from dist tarballs.

 > https://lists.freedesktop.org/archives/modemmanager-devel/2020-November/008279.html

 > Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>

Committed to master given the bugfixes, thanks.

-- 
Bye, Peter Korsgaard
