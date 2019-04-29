From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Apr 2019 22:52:59 +0200
Subject: [Buildroot] [DRAFT v1 1/7] package/gstreamer1: convert to meson
 build
In-Reply-To: <20190429194534.25743-2-ps.report@gmx.net>
References: <20190429194534.25743-1-ps.report@gmx.net>
 <20190429194534.25743-2-ps.report@gmx.net>
Message-ID: <d13454c7-6438-c4b6-8208-c3bfbc0692d9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/04/2019 21:45, Peter Seiderer wrote:
> +	-Dcheck=$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),enabled,disabled) \

 Is this intended? Or should it be _CHECK?

 Regards,
 Arnout
