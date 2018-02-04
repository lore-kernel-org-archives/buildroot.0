From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Feb 2018 11:00:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-visualisation-goom: fix
 broken hash
In-Reply-To: <20180203223150.27467-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 3 Feb 2018 23:31:50 +0100")
References: <20180203223150.27467-1-bernd.kuhls@t-online.de>
Message-ID: <87d11lyszv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Comparing both tarballs, the one from github.com and the one stored at
 > sources.buildroot.net, using diff showed no differences.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

We cannot really do this was it would break all releases since this hash
was added (2017.05). Perhaps you can bump the version instead?

-- 
Bye, Peter Korsgaard
