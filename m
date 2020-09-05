From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 05 Sep 2020 18:17:54 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/makedumpfile: new package
In-Reply-To: <20200903232648.6be84338@windsurf.home>
References: <20200831111226.15764-1-egorenar-dev@posteo.net>
 <20200903232648.6be84338@windsurf.home>
Message-ID: <87sgbwuril.fsf@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> [PATCH 1/1] shouldn't be there, it should be just [PATCH]. This is
> verified by "make check-package" in Buildroot.
>

Fixed. I didn't want to touch it because it came from upstream.
Hmm, i run 'make check-package' but it didn't catch it, but the check
found trailing spaces in makedumpfile/Config.in :)

>
> Minor nit: we need you to add your own Signed-off-by, right after the
> other Signed-off-by that are already there.


Fixed.

Thanks for feedback
Regards
Alex
