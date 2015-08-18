From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 13:08:02 +0200
Subject: [Buildroot] [PATCH] gnutls: security bump to version 3.3.17.1
In-Reply-To: <1439384809-4545-1-git-send-email-gustavo@zacarias.com.ar>
References: <1439384809-4545-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150818130802.36b83f6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 12 Aug 2015 10:06:49 -0300, Gustavo Zacarias wrote:
> Fixes GNUTLS-SA-2015-3 - Double free in certificate DN decoding.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gnutls/gnutls.hash | 2 +-
>  package/gnutls/gnutls.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, since it's a security bump, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
