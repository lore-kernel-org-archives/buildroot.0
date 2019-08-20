From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:29:00 +0200
Subject: [Buildroot] [PATCH] package/qt5: change upstream location
In-Reply-To: <28252_1564550180_5D412424_28252_18_1_20190731051618.GA2498@r-lnx-nyma7486-2>
 (yann morin's message of "Wed, 31 Jul 2019 07:16:18 +0200")
References: <22558_1564482970_5D401D9A_22558_273_1_a7cd5c93-0be9-438c-b5b5-7c5a2dc7a274@OPEXCNORM3C.corporate.adroot.infra.ftgroup>
 <87o91b5xes.fsf@dell.be.48ers.dk>
 <28252_1564550180_5D412424_28252_18_1_20190731051618.GA2498@r-lnx-nyma7486-2>
Message-ID: <87ftlv9ahf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <yann.morin@orange.com> writes:

 > Peter, All,
 > On 2019-07-30 17:56 +0200, Peter Korsgaard spake thusly:
 >> >>>>>   <yann.morin@orange.com> writes:
 >> 
 >> > From: "Yann E. MORIN" <yann.morin@orange.com>
 >> > Upstream pushes their delivery archives in to places:
 >> >     https://download.qt.io/official_releases/
 >> >     https://download.qt.io/archive/
 >> 
 >> > After a while, only the latter remains, whith the former being pruned
 >> > actively to contain only officially supported versions.
 >> 
 >> > Switch to using the archive location, as it has everything, even the
 >> > latest versions.
 >> 
 >> > Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
 >> 
 >> Committed, thanks.

 > Thanks. :-)

 >> I take it this is also for 2019.02.x?

 > Yes, this is valid for 2019.02.x amd 2019.05.x.

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
