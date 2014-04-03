From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:18:28 +0200
Subject: [Buildroot] [PATCH] rsync: make acl support non-random
In-Reply-To: <1396286890-31289-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396286890-31289-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140403201828.5bb4c9f9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 31 Mar 2014 14:28:10 -0300, Gustavo Zacarias wrote:
> If acl is selected then add it to dependencies so it can be used by
> rsync in a predictable fashion.
> Extended attributes are handled directly via linux, there's no need
> for the xattr package/library.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/rsync/rsync.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
