From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Dec 2016 11:32:02 +0100
Subject: [Buildroot] [PATCH] tslib: bump version to 1.2
In-Reply-To: <20161119104918.1e0dbf1d@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 19 Nov 2016 10:49:18 +0100")
References: <1479486965-23362-1-git-send-email-martink@posteo.de>
 <20161119104918.1e0dbf1d@free-electrons.com>
Message-ID: <871sxl5owt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Alternatively, I could come up with a new version of this patch, including
 >> only inputattach here again. (at least an updated version of it. that project
 >> is actively maintained.)

 > We normally don't include in Buildroot patches that add new features to
 > packages, so in fact this patch adding ts_finddev and inputattach
 > (which had been there for a very long time) was not even complying with
 > this rule.

 > It would however be good to have the "Linux console" project packaged,
 > so that if people were using the inputattach program from tslib, we can
 > tell them to enable the linuxconsole package.

We already have it in the input-tools package. That (old) package is
currently using Debian as upstream though.

-- 
Bye, Peter Korsgaard
