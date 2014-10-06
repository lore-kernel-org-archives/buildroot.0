From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 17:40:01 +0200
Subject: [Buildroot] [PATCH] package/erlang: build host-erlang with
 support for openssl
In-Reply-To: <1408117755-24948-1-git-send-email-yann.morin.1998@free.fr>
References: <1408117755-24948-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141006174001.0583a4f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 15 Aug 2014 17:49:15 +0200, Yann E. MORIN wrote:
> Erlang uses openssl for all things crypto.
> 
> Since there are host Erlang tools that use crypto (such as rebar), we
> need to build host-erlang with support for crypto, and thus it shall
> depends on openssl.
> 
> Suggested-by: Frank Hunleth <fhunleth@troodon-software.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>
> Cc: Johan Oudinet <johan.oudinet@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
