From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 4 Jul 2016 23:17:39 +0200
Subject: [Buildroot] [PATCH v6 1/5] runc: new package
In-Reply-To: <1467662962069-86a12333-f03da0ee-0d3ff579@mixmax.com>
References: <1467660382-6317-1-git-send-email-christian@paral.in>
 <fc921f71-eeba-bb2c-1135-4a09d2a0218b@gmail.com>
 <1467662962069-86a12333-f03da0ee-0d3ff579@mixmax.com>
Message-ID: <a7de91c6-55ed-6592-0eb2-32941df7195f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 04/07/2016 ? 22:09, Christian Stewart a ?crit :
> Romain,
> 
> On Mon, Jul 4, 2016 1:05 PM, Romain Naour romain.naour at gmail.com
> <mailto:romain.naour@gmail.com> wrote:
> 
>     Usually we prefer a stable release but ok for this new package.
> 
> 
> Unfortunately they haven't spun a release in ages and Docker is using a commit
> pin as well. It's a bit of a weird setup they have going.
> 
> I have it pinned to a newer release because some aarch64 fixes are in there.

I asked to Thomas about using -rc version and he say that it's fine for a new
package and to avoid carrying to much patches in Buildroot.

Best regards,
Romain

> 
> Best,
> Christian
> 
