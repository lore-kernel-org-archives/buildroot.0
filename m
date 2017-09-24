From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 14:58:25 +0200
Subject: [Buildroot] [PATCH 1/2] webkitgtk: update to version 2.18.0
In-Reply-To: <20170913165121.12406-1-aperez@igalia.com>
References: <20170913165121.12406-1-aperez@igalia.com>
Message-ID: <7445a29a-4ac3-d866-638d-932a6f4f551b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 18:51, Adrian Perez de Castro wrote:
> Update WebKitGTK+ to the latest stable release 2.18.0, see:
> 
>     https://webkitgtk.org/2017/09/11/webkitgtk2.18.0-released.html
> 
> The corresponding WebKit Security Advisory (WSA) has not yet been
> published.
> 
> This also bumps the required target GCC version to, due to the WebKit
> code now using more modern C++ features which were introduced in version
> 5.x of the compiler.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

 Both applied to master, thanks.

 I did make a few changes to this patch, though:

- propagate dependency to midori;
- mention in commit message why patches were removed.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
