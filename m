From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 23:33:57 +0200
Subject: [Buildroot] [PATCH 5/5 v2] package/attr: bump version
In-Reply-To: <166f3279947186301770fa28116bb6d288ee8601.1530368468.git.yann.morin.1998@free.fr>
References: <cover.1530368468.git.yann.morin.1998@free.fr>
 <166f3279947186301770fa28116bb6d288ee8601.1530368468.git.yann.morin.1998@free.fr>
Message-ID: <f7233735-e74a-efa5-be87-30ad3235bcc9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-06-18 16:21, Yann E. MORIN wrote:
> The current version of attr uses a canned custom buildsystem, that
> is borked in quite a few ways (no support for static, overwrites
> destination files without unlinking...)
> 
> There has been a release recently-ish, with a complete overhaul of
> the buildsystem. We can now drop all our patches.
> 
> The option to disable NLS has changed, so update accordingly.
> 
> Fixes: #10986
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---

[snip]
> -ATTR_SITE = http://download.savannah.gnu.org/releases/attr
> +ATTR_SITE = https://mirrors.up.pt/pub/nongnu/attr

 This must have been a mistake, so I reverted to the original site of the
specific mirror and applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
