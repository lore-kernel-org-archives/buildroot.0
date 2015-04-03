From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:32:14 +0200
Subject: [Buildroot] [PATCH 2/6] mpd: switch smb support to samba4
In-Reply-To: <1425646234-22041-2-git-send-email-gustavo@zacarias.com.ar>
References: <1425646234-22041-1-git-send-email-gustavo@zacarias.com.ar>
 <1425646234-22041-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150403143214.747706da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  6 Mar 2015 09:50:30 -0300, Gustavo Zacarias wrote:
> samba3 is deprecated upstream.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mpd/Config.in | 7 +++++--
>  package/mpd/mpd.mk    | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)

Patches 2 to 5 applied. Patches 1 and 6 were already applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
