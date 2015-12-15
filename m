From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:36:48 +0100
Subject: [Buildroot] [PATCH] libsndfile: security bump to version 1.0.26
In-Reply-To: <1450201485-5400-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450201485-5400-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151215213648.4a6c733b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 15 Dec 2015 14:44:45 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2014-9496 - SD2 buffer read overflow.
> CVE-2014-9756 - file_io.c divide by zero.
> CVE-2015-7805 - AIIF heap write overflow.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libsndfile/libsndfile.hash | 2 +-
>  package/libsndfile/libsndfile.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
