From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 23:10:25 +0100
Subject: [Buildroot] [PATCH v3 1/8] package/mpd: bump to version 0.19
In-Reply-To: <1413498543-643-1-git-send-email-jkrause@posteo.de>
References: <1413498543-643-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141027231025.6d68bdd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 17 Oct 2014 00:28:56 +0200, J?rg Krause wrote:
> * Bump to version 0.19
> * Add boost as dependency
> * Add support for libicu
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
> Changes v2 -> v3:
>   - none
> Changes v1 -> v2:
>   - fix missing dependency of boost
> ---
>  package/mpd/Config.in |  4 +++-
>  package/mpd/mpd.mk    | 14 +++++++++++---
>  2 files changed, 14 insertions(+), 4 deletions(-)

Entire series applied, thanks. There was just one patch where you
forgot to add a comment related to a new toolchain dependency (the nfs
patch), but other than that, I haven't seen any other issue. I did one
build test of a certain configuration, and for the other
configurations we'll see what the autobuilders have to say :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
