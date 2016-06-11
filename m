From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 15:54:29 +0200
Subject: [Buildroot] [PATCH 1/3] gnuradio: add gr-audio support
In-Reply-To: <1461917534-27882-1-git-send-email-gwenj@trabucayre.com>
References: <1461917534-27882-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20160611155429.0fe665a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 10:12:12 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> gr-audio is a gnuradio module to use audio card as sink or source.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  package/gnuradio/Config.in   |  6 ++++++
>  package/gnuradio/gnuradio.mk | 12 ++++++++++++
>  2 files changed, 18 insertions(+)

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
