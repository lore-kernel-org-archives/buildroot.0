From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 02:20:57 +0200
Subject: [Buildroot] [PATCH v2 4/4] pcmanfm: bump version to 1.2.3
In-Reply-To: <1416583990-35169-4-git-send-email-Vincent.Riera@imgtec.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
 <1416583990-35169-4-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150713022057.5e8d65a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 21 Nov 2014 15:33:10 +0000, Vicente Olivert Riera wrote:
> - Bump version to 1.2.3
> - Remove unnecessary patch
> - Add a hash file
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2: nothing

Applied after some changes:

    [Thomas:
     - adapt patch to the latest master
     - license is GPLv2+, not GPLv2
     - replace 'select BR2_PACKAGE_XORG7' by 'depends on
       BR2_PACKAGE_XORG7']

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
