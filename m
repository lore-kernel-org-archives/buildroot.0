From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Jun 2018 22:34:32 +0200
Subject: [Buildroot] [PATCH] pulseaudio: remove autoreconf
In-Reply-To: <9f57c97750d5799dbc96ceeae29a800d80c96a76.1529611878.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 21 Jun 2018 23:11:18 +0300")
References: <9f57c97750d5799dbc96ceeae29a800d80c96a76.1529611878.git.baruch@tkos.co.il>
Message-ID: <87wourlvzb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit 08c7b77803285 (package/pulseaudio: bump version to 12.0) removed
 > configure.ac patch, but forgot to drop autoreconf. Fix that.

 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
