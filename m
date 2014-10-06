From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 21:17:04 +0200
Subject: [Buildroot] [PATCH 1/1] openvmtools: remove unnecessary C flag
In-Reply-To: <1412594238-39906-1-git-send-email-kaszak@gmail.com>
References: <1412594238-39906-1-git-send-email-kaszak@gmail.com>
Message-ID: <20141006211704.53ddcbd8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Mon,  6 Oct 2014 13:17:18 +0200, Karoly Kasza wrote:
> Since commit 8bec0a1af57165081dc275f813c8c5c74ff12c14
> the -Wno-unused-local-typedefs CFLAG in not needed.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  package/openvmtools/openvmtools.mk |    1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
