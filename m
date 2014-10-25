From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 10:48:22 +0200
Subject: [Buildroot] [PATCH] coreutils: add optionals, use single binary
In-Reply-To: <1414202806-12495-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414202806-12495-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141025104822.3a7c2dc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 24 Oct 2014 23:06:45 -0300, Gustavo Zacarias wrote:
> Add proper support for optional libraries: acl, attr, gmp & libcap.
> 
> Also build the single binary as pointed out by P?draig Brady for some
> neat space savings.
> Use the shebang (default) method since it allows us to move binaries
> into other directories to suit our needs whereas for symlink that
> wouldn't be so easy.

Indeed, very nice space saving.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
