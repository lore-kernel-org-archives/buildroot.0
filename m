From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:23:13 +0200
Subject: [Buildroot] [PATCH 1/2] package: new category for fonts, icons,
 sounds and themes
In-Reply-To: <1427920935-11391-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427920935-11391-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150401232313.5ad99079@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  1 Apr 2015 17:42:14 -0300, Gustavo Zacarias wrote:
> Move all of the scattered fonts, icons, sound packs and themes into a
> new category for them.
> In preparation for the inclusion of more fonts.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)

Both patches applied. I think this patch especially is a good idea,
these stuff were currently spread all over the place, with no clear
category for them.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
