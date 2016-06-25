From: James Knight <james.d.knight@live.com>
Date: Sat, 25 Jun 2016 00:29:10 -0400
Subject: [Buildroot] [PATCH 2/2 v2] kodi: enable optional dependency on
	libamcodec
In-Reply-To: <trinity-c3fda4ab-7b95-4635-ad06-89c4b3e15c13-1465620413342@3capp-mailcom-bs07>
References: <20160610115151.19226-1-daggs@gmx.com>
 <20160610115151.19226-2-daggs@gmx.com>
 <5o6r2dxrp2.ln2@ID-313208.user.individual.net>
 <trinity-c3fda4ab-7b95-4635-ad06-89c4b3e15c13-1465620413342@3capp-mailcom-bs07>
Message-ID: <CALAjcgVM8DLkoSEZcusOusXC52dEQfbin-=gHG0iGdaU03Xv=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daggs, Bernd;

On Sat, Jun 11, 2016 at 12:46 AM, daggs <daggs@gmx.com> wrote:
> the change described here is regarding andorid.
> unless I'm mistaken

I believe you are correct. Examining the commit [1] shows that the
change is really Android specific (whether or not the merge's
description [2] doesn't indicate so).

[1]: https://github.com/xbmc/xbmc/pull/9688/commits/1015c480966d786eb050ce3d3701cdbf5231d1f5
[2]: https://github.com/xbmc/xbmc/pull/9688
