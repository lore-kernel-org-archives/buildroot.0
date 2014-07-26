From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:07:48 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/Makefile.in: fix coding
 style regarding the '=' sign
In-Reply-To: <1406306319-11972-2-git-send-email-fabio.porcedda@gmail.com>
References: <1406306319-11972-1-git-send-email-fabio.porcedda@gmail.com>
 <1406306319-11972-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140726090748.03898d6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 25 Jul 2014 18:38:37 +0200, Fabio Porcedda wrote:
> As stated in the buildroot user manual add just a single space before
> and after a '=' sign.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  package/Makefile.in | 148 ++++++++++++++++++++++++++--------------------------
>  1 file changed, 74 insertions(+), 74 deletions(-)

Thanks, I've applied this one, after checking that a "diff -w -u" (i.e
diff ignoring whitespace changes) returns an empty result between the
old and new versions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
