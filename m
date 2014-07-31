From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 20:21:09 +0200
Subject: [Buildroot] [PATCH v2 1/1] Remove unsupported libcue from
 package mpd
In-Reply-To: <1406760343-31270-1-git-send-email-jkrause@posteo.de>
References: <1406760343-31270-1-git-send-email-jkrause@posteo.de>
Message-ID: <20140731202109.22009f71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 31 Jul 2014 00:45:43 +0200, J?rg Krause wrote:
> Support for libcue has been removed for mpd since version 0.17.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/mpd/Config.in | 6 ------
>  package/mpd/mpd.mk    | 6 ------
>  2 files changed, 12 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
