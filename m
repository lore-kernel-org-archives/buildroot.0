From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 23:11:19 +0100
Subject: [Buildroot] [PATCHv2 1/1] MPD: Add jack output support option
In-Reply-To: <1407503492-7464-1-git-send-email-pieter.degendt@gmail.com>
References: <1407503492-7464-1-git-send-email-pieter.degendt@gmail.com>
Message-ID: <20141030231119.5da6b4f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pieter De Gendt,

On Fri,  8 Aug 2014 15:11:32 +0200, Pieter De Gendt wrote:
> 
> Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
> ---
> Changes v1 -> v2:
>   - Removed duplicate depends entries
>   - Alpha sorting all entries
> 
>  package/mpd/Config.in |   31 +++++++++++++++++++++----------
>  package/mpd/mpd.mk    |    5 +++++
>  2 files changed, 26 insertions(+), 10 deletions(-)

Thanks, I've applied your patch after adapting it to the latest master,
which has received quite a few changes in the mpd package.

Thanks for your contribution, and sorry for the slow answer.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
