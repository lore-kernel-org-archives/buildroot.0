From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Oct 2012 18:37:55 +0200
Subject: [Buildroot] [PATCH v10 08/10] microperl: mark as DEPRECATED
In-Reply-To: <1349881591-7062-8-git-send-email-francois.perrad@gadz.org>
References: <1349881591-7062-1-git-send-email-francois.perrad@gadz.org>
 <1349881591-7062-8-git-send-email-francois.perrad@gadz.org>
Message-ID: <20121012183755.7b2429a2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed, 10 Oct 2012 17:06:29 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/microperl/Config.in |    1 +
>  1 file changed, 1 insertion(+)

Drop this one. You are removing microperl in PATCH 10/10, so it doesn't
make sense to have in the same series a patch that deprecates it.
Deprecating it would make sense if we intended to keep the microperl
package around for another release cycle or two, but if we intend to
remove it right now, then just do it.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
