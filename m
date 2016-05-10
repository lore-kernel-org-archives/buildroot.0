From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 May 2016 21:47:26 +0200
Subject: [Buildroot] [PATCH 1/1] rrdtool: bump version to 1.6.0
In-Reply-To: <6F0EDAB157804BB59AB100B24715D868@ROLANDAMD64> (Roland Franke's
 message of "Tue, 10 May 2016 19:22:31 +0200")
References: <1462824635-15327-1-git-send-email-fli4l@franke-prem.de>
 <20160509232119.668c0b36@free-electrons.com>
 <5731B8FC.8070403@zacarias.com.ar>
 <6F0EDAB157804BB59AB100B24715D868@ROLANDAMD64>
Message-ID: <87wpn1k84x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roland" == Roland Franke <fli4l@franke-prem.de> writes:

 > Hello,
 > On 09/05/16 18:21, Thomas Petazzoni wrote:

 >>> Enabling autoreconf and gettextize was added when
 >>> 0001-Add-configure-option-to-disable-documentation.patch was added by
 >>> Gustavo. So I would assume that they could now be removed.
 >>> 
 >>> However, it turns out that rrdtool 1.6.0 doesn't build without
 >>> autoreconf+gettextize, I'm not sure why. In any case, the comment
 >>> should be updated and not removed.

 >> Hi all.
 >> What's the failure you're seeing by dropping autoreconf/gettextize?
 >> On my end it seems to build just fine.

 > my fault. was not testing without autoreconf+gettextize first.
 > Now made localy on my system and build was working fine.

Ok, great. Will you send an updated patch removing
autoreconf/gettextize?

-- 
Bye, Peter Korsgaard
