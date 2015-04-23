From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Apr 2015 02:43:47 -0300
Subject: [Buildroot] [PATCH v7 6/8] toolchain/external: ignore missing
 hash for custom downloaded toolchain
In-Reply-To: <1429740521-31943-7-git-send-email-arnout@mind.be>
References: <1429740521-31943-1-git-send-email-arnout@mind.be>
 <1429740521-31943-7-git-send-email-arnout@mind.be>
Message-ID: <55388693.1020605@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/2015 07:08 PM, Arnout Vandecappelle (Essensium/Mind) wrote:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> We will *always* be missing a hash file for custom external toolchains
> that are downloaded.
> 
> So, just ignore that failure.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
