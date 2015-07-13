From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 02:20:14 +0200
Subject: [Buildroot] [PATCH v2 2/4] menu-cache: new package
In-Reply-To: <1416583990-35169-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
 <1416583990-35169-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150713022014.7dbc07ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 21 Nov 2014 15:33:08 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2: Remove GETTEXT and LIBICONV lines. Copy/Paste error

Applied after some changes:

    [Thomas:
      - Remove the MENU_CACHE_VERSION_MINOR variable, not needed.
        Noticed by Yann E. Morin.
      - Rewrap Config.in help text.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
