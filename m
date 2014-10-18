From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 19:26:21 +0200
Subject: [Buildroot] [PATCH] libxml2: explicitly state zlib dir
In-Reply-To: <1413635453-13573-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413635453-13573-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141018192621.745a1c9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 18 Oct 2014 09:30:53 -0300, Gustavo Zacarias wrote:
> Pass the zlib directory prefix to --with-zlib otherwise it expands into
> absolute (distribution) directories leading to bad test results in
> configure. Fixes:
> http://autobuild.buildroot.net/results/303/303d6d165c5423944122bf430575c018479733f8/build-end.log
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libxml2/libxml2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
