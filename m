From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 10:47:30 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-userland: needs threads
In-Reply-To: <1381221408-15700-1-git-send-email-phil@zankapfel.net>
References: <1381221408-15700-1-git-send-email-phil@zankapfel.net>
Message-ID: <20131008104730.75f1bcbd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Phil Eichinger,

On Tue,  8 Oct 2013 10:36:48 +0200, Phil Eichinger wrote:
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>  package/rpi-userland/Config.in |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Thanks. Not sure how you found this, but note that it is also fixes an
autobuilder failure:

  http://autobuild.buildroot.net/results/c3b4c09edee2499e811808018be1858bdee70436/

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
