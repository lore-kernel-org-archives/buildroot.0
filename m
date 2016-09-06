From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:51:24 +0200
Subject: [Buildroot] [PATCH 1/9] package/efl: bump to 1.18.0
In-Reply-To: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
References: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160906215124.23088053@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Sep 2016 22:31:27 +0200, Romain Naour wrote:
> Elementary, evas-generic-loaders and emotion-generic-loaders are now
> part of efl 1.18 package [1].
> 
> Merge the elementery and evas-generic-loaders package to the efl one.
> 
> Rename librsvg option (srvg/libsrvg)
> 
> [1] https://phab.enlightenment.org/w/efl_and_elementary_1_18/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/Config.in | 14 ++++++++++++++
>  package/efl/efl.hash  |  4 ++--
>  package/efl/efl.mk    | 35 ++++++++++++++++++++++++++++++++++-
>  3 files changed, 50 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
