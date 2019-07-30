From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jul 2019 17:56:11 +0200
Subject: [Buildroot] [PATCH] package/qt5: change upstream location
In-Reply-To: <22558_1564482970_5D401D9A_22558_273_1_a7cd5c93-0be9-438c-b5b5-7c5a2dc7a274@OPEXCNORM3C.corporate.adroot.infra.ftgroup>
 (yann morin's message of "Tue, 30 Jul 2019 12:36:00 +0200")
References: <22558_1564482970_5D401D9A_22558_273_1_a7cd5c93-0be9-438c-b5b5-7c5a2dc7a274@OPEXCNORM3C.corporate.adroot.infra.ftgroup>
Message-ID: <87o91b5xes.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Upstream pushes their delivery archives in to places:
 >     https://download.qt.io/official_releases/
 >     https://download.qt.io/archive/

 > After a while, only the latter remains, whith the former being pruned
 > actively to contain only officially supported versions.

 > Switch to using the archive location, as it has everything, even the
 > latest versions.

 > Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>

Committed, thanks.

I take it this is also for 2019.02.x?

-- 
Bye, Peter Korsgaard
