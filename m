From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 00:14:03 +0200
Subject: [Buildroot] [PATCH 1/6] gnutls: update legal info
In-Reply-To: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160705001403.3c4acc33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jul 2016 18:16:21 +0530, Rahul Bedarkar wrote:
> GnuTLS core library is licensed under LGPLv2.1+ while gnutls-openssl
> library is licensed under GPLv3+. Annotate the license with components.
> 
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/gnutls/gnutls.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied with some changes:

    [Thomas:
     - add comment about the license of the "core library" since some files
       seems to be mistakenly under LGPLv3+ even though the library is
       licensed under LGPLv2.1+.
     - add the README file in the license information, since it contains a
       lot of useful details.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
