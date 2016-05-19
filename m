From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 May 2016 16:06:03 +0200
Subject: [Buildroot] [PATCH 2/2] connman: remove xtables build fix patch
In-Reply-To: <1463664337-881-2-git-send-email-gustavo@zacarias.com.ar>
References: <1463664337-881-1-git-send-email-gustavo@zacarias.com.ar>
 <1463664337-881-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160519160603.3debab78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 10:25:37 -0300, Gustavo Zacarias wrote:
> This was added in 0dece985 to deal with kernel headers 4.5 -> 4.5.4
> breakage. Unfortunately the fix in 4.5.5 and 4.6+ doesn't deal correctly
> with this causing more build breakage, so we'd rather "break" for the
> small range of 4.5.x versions broken than for the rest of time.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/connman/0001-xtables.patch | 61 --------------------------------------
>  1 file changed, 61 deletions(-)
>  delete mode 100644 package/connman/0001-xtables.patch

Does this fixes some autobuilder failures?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
