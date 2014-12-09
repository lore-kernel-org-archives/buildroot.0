From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 19:54:34 +0100
Subject: [Buildroot] [PATCH 4/6] package/mpd: fix line length for help
 text
In-Reply-To: <1418078694-26331-4-git-send-email-jkrause@posteo.de>
References: <1418078694-26331-1-git-send-email-jkrause@posteo.de>
 <1418078694-26331-4-git-send-email-jkrause@posteo.de>
Message-ID: <20141209195434.263819a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon,  8 Dec 2014 23:44:52 +0100, J?rg Krause wrote:
> Make help text lines not longer as 80 characters (one tab weights eight chars).
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/mpd/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, after wrapping some other help texts that were also too long
(at least from Emacs text wrapping perspective, which as we all know is
the absolute rule everyone must follow! :-))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
