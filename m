From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 18:45:43 +0100
Subject: [Buildroot] [PATCH] gnutls: add crywrap clock_gettime patch
In-Reply-To: <1388074436-30285-1-git-send-email-gustavo@zacarias.com.ar>
References: <1388074436-30285-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131226184543.22ace1fd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 26 Dec 2013 13:13:56 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/1bd/1bd67b616e996d684dd584576569517f4653addd/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gnutls/gnutls-01-gettime.patch | 25 +++++++++++++++++++++++++
>  package/gnutls/gnutls.mk               |  2 ++
>  2 files changed, 27 insertions(+)
>  create mode 100644 package/gnutls/gnutls-01-gettime.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
