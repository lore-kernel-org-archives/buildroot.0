From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:51:03 +0200
Subject: [Buildroot] [PATCH 1/1] espeak: depends on threads
In-Reply-To: <1407237387-22664-1-git-send-email-arnaud@intelibre.fr>
References: <1407237387-22664-1-git-send-email-arnaud@intelibre.fr>
Message-ID: <20140806195103.077c858a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnaud,

On Tue,  5 Aug 2014 13:16:27 +0200, arnaud at intelibre.fr wrote:
> From: Arnaud Aujon <arnaud@intelibre.fr>
> 
> Fixes autobuild failure : http://autobuild.buildroot.org/results/f39/f3903d2b4a16226df2d460dcd2e26c7fb87613ab
> 
> Signed-off-by: Arnaud Aujon <arnaud@intelibre.fr>
> ---
>  package/espeak/Config.in | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

Thanks, applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
