From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Mar 2020 18:07:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to v12.16.1
In-Reply-To: <20200303224315.2237b29c@windsurf.home> (Thomas Petazzoni's
 message of "Tue, 3 Mar 2020 22:43:15 +0100")
References: <20200303191133.10404-1-aduskett@gmail.com>
 <20200303224315.2237b29c@windsurf.home>
Message-ID: <87sgimafyd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Adam,
 > On Tue,  3 Mar 2020 11:11:33 -0800
 > aduskett at gmail.com wrote:

 >> From: Adam Duskett <Aduskett@gmail.com>
 >> 
 >> Tested on Debian 9 and Ubuntu 18.04
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/9d3545a76c4f5c06debf319687498d662a53fafb
 >> http://autobuild.buildroot.net/results/4da6c695b8ceca0a6eee2481a1b873a46676d0f5

 > Are you positive that this bump fixes the ICU issues? I.e did you
 > reproduce the ICU issues before this version bump, and confirm they
 > disappeared solely because of the version bump?

Committed to master after dropping the fixes as discussed on IRC and
extending the commit message info about the regressions fixed in
12.16.1, thanks.

-- 
Bye, Peter Korsgaard
