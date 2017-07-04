From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 18:07:48 +0200
Subject: [Buildroot] [RFC PATCH v5 00/11] Make the SDK relocatable
In-Reply-To: <1498811828-6893-1-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
Message-ID: <20170704180748.1b9660d4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 10:36:57 +0200, Wolfgang Grandegger wrote:

>   support/scripts: add reloacte-sdk.sh script for SDK relocation

Applied to master, after doing the fixes suggested by Arnout.

>   package/qt5base: provide "qt.conf" to make "qmake" relocatable

Applied to master, after doing the fixes suggested by Arnout.

All your other patches have been marked as "Changes Requested", as they
got some more fundamental comments.

If you have the chance to respin the series today/tomorrow, it'd be
great, as we are all together here and therefore able to quickly
discuss/merge the series.

Thanks a lot for this work, much appreciated!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
