From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 16:37:16 +0200
Subject: [Buildroot] [PATCH] icu: update icudata generator URL
In-Reply-To: <1436542351-12063-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1436542351-12063-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20150712163716.4f2c8d86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gustavo.zacarias at free-electrons.com,

On Fri, 10 Jul 2015 12:32:31 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> It was pointing to version 51.x which wouldn't work well with 55.x.
> 
> Point it to the latest version that matches the current buildroot
> version (55). When a new ICU major version is released a link for the
> "old" 55 version will be available below as is it currently for
> previous versions such as 54, 53 and so on.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/icu/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
