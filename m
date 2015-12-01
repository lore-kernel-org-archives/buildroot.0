From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 17:53:44 +0100
Subject: [Buildroot] [PATCH] gnutls: bump to version 3.4.7
In-Reply-To: <1448889395-16383-1-git-send-email-gustavo@zacarias.com.ar>
References: <1448889395-16383-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151201175344.77a580b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 30 Nov 2015 10:16:35 -0300, Gustavo Zacarias wrote:
> The 3.4 series has been promoted to stable.
> Handle autodeps more concisely (idn, p11-kit, zlib).
> libtasn1 is now mandatory, since otherwise gnutls uses the bundled
> version it makes no sense to try that because of target duplication.
> Disable tpm support since we've got no trousers package.

Note that we have a trousers package pending in the queue.

> Disable libdane support since we've got no dane package.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gnutls/Config.in   |  1 +
>  package/gnutls/gnutls.hash |  2 +-
>  package/gnutls/gnutls.mk   | 41 ++++++++++++++++++++++++++++++-----------
>  3 files changed, 32 insertions(+), 12 deletions(-)

Applied to next-soon-to-be-master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
