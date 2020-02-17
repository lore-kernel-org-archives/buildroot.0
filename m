From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Feb 2020 09:41:58 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-02-16
In-Reply-To: <CAEyMn7bOB5eAzxAP_mrTepB5tEMUyeXvpgV=_8t=rsPWZHTNDA@mail.gmail.com>
 (Heiko Thiery's message of "Mon, 17 Feb 2020 08:50:29 +0100")
References: <5e4a3e2f.1c69fb81.d871b.e5bdSMTPIN_ADDED_MISSING@mx.google.com>
 <CAEyMn7bOB5eAzxAP_mrTepB5tEMUyeXvpgV=_8t=rsPWZHTNDA@mail.gmail.com>
Message-ID: <87mu9hd2qx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > Hi Thomas and all,
 > Am Mo., 17. Feb. 2020 um 08:18 Uhr schrieb Thomas Petazzoni
 > <thomas.petazzoni@bootlin.com>:
 >> 
 >> Hello,
 >> 
 >> Outdated packages
 >> =================
 >> 
 >> This is the list of packages for which a new version has been detected
 >> and for which you are a registered developer. Please help us improving
 >> the quality of Buildroot by bumping these packages to their latest
 >> version. Thanks!
 >> 
 >> name              | found by |        link to release-monitoring.org        |   version    |   upstream
 >> -------------------------------+----------+----------------------------------------------+--------------+--------------
 >> libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 1.1.3        | 1.1.7
 >> libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.109      | 1.0.130
 >> sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.3.21       | 1.4.2
 >> 
 >> --
 >> http://autobuild.buildroot.net

 > just got the mail about this outdated packages.

 > I wanted to update but recognized that the libnetconf2 library does
 > not build with the libssh 0.9.3 because of a regression in libssh that
 > prevents a successfull build:
 > https://github.com/CESNET/libnetconf2/blob/master/CMakeLists.txt#L237

 > The issue is reported upstream and seems to be fixed in the master
 > branch of libssh. So I would propose to wait for the next release to
 > libssh before updating this packages.

OK.

-- 
Bye, Peter Korsgaard
