From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 08:38:35 +0100
Subject: [Buildroot] [PATCH 1/1] bonnie: Expand description in config
 help text.
In-Reply-To: <1454101564-19545-1-git-send-email-camh@xdna.net>
References: <1454101564-19545-1-git-send-email-camh@xdna.net>
Message-ID: <20160130083835.13920efd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Cam Hutchison,

On Sat, 30 Jan 2016 08:06:04 +1100, Cam Hutchison wrote:
> The description "Filesystem tester" is rather unhelpful. Take the
> description from the referenced web site to make it a bit clearer what
> bonnie++ actually is.
> 
> Signed-off-by: Cam Hutchison <camh@xdna.net>
> ---
>  package/bonnie/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I've applied, after rewrapping your proposed Config.in help text since
the lines were too long (longer than 72 characters).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
