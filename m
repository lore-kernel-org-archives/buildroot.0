From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 02:20:31 +0200
Subject: [Buildroot] [PATCH v2 3/4] libfm: new package
In-Reply-To: <1416583990-35169-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
 <1416583990-35169-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150713022031.6c54e14d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 21 Nov 2014 15:33:09 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2: nothing

Applied after some changes:

    [Thomas:
      - switch from 'select BR2_PACKAGE_XORG7' to 'depends on
        BR2_PACKAGE_XORG7' as suggested by Yann E. Morin.
      - add LGPLv2.1+ in the list of licenses as well as a corresponding
        license file, as suggested by Yann E. Morin.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
