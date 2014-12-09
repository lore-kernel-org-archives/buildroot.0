From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 19:18:38 +0100
Subject: [Buildroot] [PATCH v2 1/1] python-docopt: new package
In-Reply-To: <1418120893-27306-1-git-send-email-alvaro.gamez@hazent.com>
References: <1418120893-27306-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20141209191838.55dd455e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro G. M,

On Tue,  9 Dec 2014 11:28:13 +0100, Alvaro G. M wrote:
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>

Applied, thanks. I did a small number of changes, though:

    [Thomas:
      - Remove dependency on python || python3, as we did for all other
        python modules that work with both Python 2 and Python 3.
      - Rewrap help text.
      - Add <pkg>_LICENSE_FILES value.]

See
http://git.buildroot.net/buildroot/commit/?id=765b7e1995fac384d26de269e33ad48697ed747a
for the final commit.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
