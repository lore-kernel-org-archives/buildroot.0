From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 15 Oct 2016 12:54:23 +0200
Subject: [Buildroot] [PATCH 2/2] core/legal-info: don't generate big
 file with all license texts
In-Reply-To: <52e41b4a3aab9e9d50ace8aee2501becc5080bb8.1476519329.git.yann.morin.1998@free.fr>
References: <cover.1476519329.git.yann.morin.1998@free.fr>
 <52e41b4a3aab9e9d50ace8aee2501becc5080bb8.1476519329.git.yann.morin.1998@free.fr>
Message-ID: <3ccbad10-37e8-c0a1-543b-6ce5507ad9e0@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

On 15/10/2016 10:15, Yann E. MORIN wrote:
> By aggregating all the license files into a single big text-only file
> means we have no way to use license files that are binary blobs (e.g.
> pdf, rtf...).

Yeah, and we have a few PDFs already: libraw and libilbc.

> Just do not generate that big file; if the user still wants it, it is
> very easy to create it afterwards.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
