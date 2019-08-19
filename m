From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 21:47:03 +0200
Subject: [Buildroot] [PATCH] dehydrated: critical bump to 0.6.5
In-Reply-To: <20190819163749.14021-1-arnout@mind.be>
References: <20190819163749.14021-1-arnout@mind.be>
Message-ID: <20190819214703.3e733ee5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Aug 2019 18:37:49 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> On July 3, 2019, Let's Encrypt deployed new ACME server software that no
> longer returns the 'id' field in the account information JSON.
> Dehydrated relied on this field, even though it is not specified by RFC
> 8555. Because of this, dehydrated can no longer create a new account on
> Let's Encrypt.
> 
> This was fixed by upstream commits be13dcd and 4f358e2. But the latter
> broke ACMEv1 support so was fixed again in commit f60f2f8.
> 
> Cherry-picking this correctly is tricky, so instead just bump the
> version. There are quite a few non-bugfix changes that are included this
> way, but it's more risky to try to cherry-pick.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Commit title should have been prefixed with "package/dehydrated" :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
