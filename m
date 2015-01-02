From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 13:26:28 +0100
Subject: [Buildroot] [PATCH 10/10] package/dvb-app: remove tests
In-Reply-To: <1419717508-11627-11-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
 <1419717508-11627-11-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150102132628.6cef7d66@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 27 Dec 2014 22:58:28 +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/dvb-apps/0004-Makefile-remove-test.patch | 27 ++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/dvb-apps/0004-Makefile-remove-test.patch

Ok, now I understand why patch 09/10 was not working.

If patch 09/10 needs patch 10/10 to work, then patch 10/10 needs to be
*before* patch 09/10 in the series, or be squashed into it.

Patch rejected, please resend an updated version.

Also, if you could send to upstream dvb-apps those patches (and the
other ones we have), it would be great.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
