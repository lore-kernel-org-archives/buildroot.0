From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:10:56 +0200
Subject: [Buildroot] [PATCH 01/13] package/erlang-goldrush: add .hash
 file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160618151056.36460a83@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 23:23:51 +0200, Romain Naour wrote:
> Similar to jquery-keyboard, it seems the erlang-goldrush tarball on the
> autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
> s.b.o mirror.
> 
> Fixes:
> http://autobuild.buildroot.org/results/074/07463f3478f334ab9c7dda2dbb2a02b4f29faca1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/erlang-goldrush/erlang-goldrush.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/erlang-goldrush/erlang-goldrush.hash

Entire series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
