From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 16:00:29 +0100
Subject: [Buildroot] [PATCH v2] sdl_mixer: fix static linking issue
In-Reply-To: <20161208172331.GA13013@waldemar-brodkorb.de>
References: <20161208172331.GA13013@waldemar-brodkorb.de>
Message-ID: <20161210160029.03a9865f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Dec 2016 18:23:31 +0100, Waldemar Brodkorb wrote:
> LDFLAGS must be passed when creating binaries.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../sdl_mixer/0002-add-LDFLAGS-while-linking.patch | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/sdl_mixer/0002-add-LDFLAGS-while-linking.patch

Applied to master, thanks. Please submit the patch upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
