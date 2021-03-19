From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 18:21:50 +0100
Subject: [Buildroot] [PATCH 0/9] packages: Add more SELinux modules to
 some packages
In-Reply-To: <20210316231158.0035f440@windsurf.home> (Thomas Petazzoni's
 message of "Tue, 16 Mar 2021 23:11:58 +0100")
References: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
 <20210316231158.0035f440@windsurf.home>
Message-ID: <87r1kbuki9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu, 28 Jan 2021 10:27:48 +0100
 > Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

 >> Maxime Chevallier (9):
 >> package/alsa-utils: add SELinux repolicy module
 >> package/bridge-utils: add SELinux refpolicy module
 >> package/dmidecode: add SELinux refpolicy module
 >> package/hwloc: add SELinux refpolicy module
 >> package/kexec: add SELinux refpolicy module
 >> package/kexec-lite: add SELinux refpolicy module
 >> package/kismet: add SELinux refpolicy module
 >> package/logrotate: add SELinux refpolicy module
 >> package/mcelog: add SELinux refpolicy module

 > Thanks, series applied!

While not exactly bugfixes, they do seem pretty safe and nice to have
when SELinux is used, so applied to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
