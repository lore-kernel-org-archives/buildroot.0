From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 16:25:02 +0100
Subject: [Buildroot] [PATCH v2 01/37] package/qt5: drop 5.6 support
In-Reply-To: <20200226144608.12529-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 26 Feb 2020 15:45:32 +0100")
References: <20200226144608.12529-1-peter@korsgaard.com>
Message-ID: <87tv3d74mp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > As discussed during the FOSDEM2019 develop days, Qt 5.6 is very old (5.6.3
 > was released in September 2017, and 5.6.x became EOL in March 2019), so drop
 > it before the new Buildroot LTS release:

 > https://elinux.org/Buildroot:DeveloperDaysFOSDEM2019#Qt5_versions_to_support:_keep_5.6_or_a_newer_LTS.3F

 > And add legacy handling for it.

 > There are a number of places where code checks for
 > BR2_PACKAGE_QT5_VERSION_LATEST, so leave that as a blind option for now to
 > not break the build.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Changes since v1:
 > - Leave BR2_PACKAGE_QT5_VERSION_LATEST as a blind option for
 >   bisectability

Committed, thanks.

The rest of the series is not strictly needed for master, so I will
apply the series to next instead.

If it doesn't blow up / needed, it can then later be applied to master
as well.

-- 
Bye, Peter Korsgaard
