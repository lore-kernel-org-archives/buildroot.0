From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:26:39 +0100
Subject: [Buildroot] [PATCH] libcurl: enable mbedtls support
In-Reply-To: <1452106417-12097-1-git-send-email-gustavo@zacarias.com.ar>
References: <1452106417-12097-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160308212639.0d5eec08@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  6 Jan 2016 15:53:37 -0300, Gustavo Zacarias wrote:
> Now that we've got an mbedtls package in the tree we can enable the
> optional support for it in libcurl.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libcurl/libcurl.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied with an improved commit log, as suggested by Luca.

Gustavo, for the record, I do agree with Luca that an additional
explanation was needed. It is a pity that you refused to send an
updated version, and simply referred to the ML archives as a way of
explaining your patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
