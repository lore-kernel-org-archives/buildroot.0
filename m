From: vadim4j at gmail.com <vadim4j@gmail.com>
Date: Mon, 24 Feb 2020 22:36:27 +0200
Subject: [Buildroot] [PATCH 1/3] package/libyang: enable LYD_PRIV option
In-Reply-To: <20200224205206.622a2c5e@windsurf>
References: <20200224172652.30932-1-vadim4j@gmail.com>
 <20200224172652.30932-2-vadim4j@gmail.com>
 <20200224205206.622a2c5e@windsurf>
Message-ID: <20200224203627.GA34982@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 24, 2020 at 08:52:06PM +0100, Thomas Petazzoni wrote:
> On Mon, 24 Feb 2020 19:26:50 +0200
> Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> > This option is required by frr package, so enable it by default.
> > 
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> 
> What is this option doing? How much more space does it require? In
> other words, do we want to enable it unconditionally, or do we want to
> make it optional ?
> 

Sorry, I did not compare it, actually this option might be turned on
if rtrlib is selected. Moreover rtrlib adding might be dropped from this
series because (my mistake I missed this) frr requires rtrlib for rpki
support only, which might be not enabled by default.

Regards,
Vadim Kochan
