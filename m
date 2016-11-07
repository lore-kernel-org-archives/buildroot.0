From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 21:57:51 +0100
Subject: [Buildroot] [PATCH 01/14] gstreamer1: bump to version 1.10.0
In-Reply-To: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
References: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161107215751.31c28203@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 06:58:27 -0300, Gustavo Zacarias wrote:
> Remove gstconfig.h compatibility kludge since it has been
> fixed/reinstated upstream.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gstreamer1/gstreamer1/gstreamer1.hash |  4 ++--
>  package/gstreamer1/gstreamer1/gstreamer1.mk   | 12 +-----------
>  2 files changed, 3 insertions(+), 13 deletions(-)

I've applied the entire series to next, with a few fixes on some
patches, I'll reply to the specific patches.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
