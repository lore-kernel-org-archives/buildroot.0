From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 15:40:11 +0200
Subject: [Buildroot] [PATCH] package/ca-certificates: generate the
 bundle of certs
In-Reply-To: <1428016146-15442-1-git-send-email-yann.morin.1998@free.fr>
References: <1428016146-15442-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150403154011.47b71626@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  3 Apr 2015 01:09:06 +0200, Yann E. MORIN wrote:
> glib-networking wants to use the certificates bundle, not the individual
> certificates.
> 
> Generating the bundle is usually done with update-ca-certificates, but
> that does not support running out-of-tree.
> 
> Fortiunately, and as Gustavo put it, update-ca-certificates is jsut a
> glorified 'cat'. It is supposed to be fed a config file stating which
> certificate to add/remove to/from the bundle, otherwise nothing fancy
> (Oh, yes, running hooks after updating the bundle).
> 
> Since we do not need any of this in Buidlroot, we jsut generate a bundle
> with all certificates unconditionally.
> 
> Reported-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
