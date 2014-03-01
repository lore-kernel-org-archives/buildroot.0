From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:06:19 +0100
Subject: [Buildroot] [PATCH 12/24] luajson: new package
In-Reply-To: <1393227301-14874-13-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <1393227301-14874-13-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140301160619.1611e814@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Mon, 24 Feb 2014 08:34:48 +0100, Francois Perrad wrote:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in          |    1 +
>  package/luajson/Config.in  |    8 ++++++++
>  package/luajson/luajson.mk |   13 +++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/luajson/Config.in
>  create mode 100644 package/luajson/luajson.mk

Thanks, applied after fixing the two comments made by Arnout.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
