From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:07:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcodec2: disable unittest
In-Reply-To: <20170802165217.24046-1-bernd.kuhls@t-online.de>
References: <20170802165217.24046-1-bernd.kuhls@t-online.de>
Message-ID: <20170802190757.17499d99@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Aug 2017 18:52:17 +0200, Bernd Kuhls wrote:
> Quoting
> https://svn.code.sf.net/p/freetel/code/codec2-dev/CMakeLists.txt
> "# Unittest should be on for dev builds and off for releases."
> 
> If unittest is enabled libcodec2 depends on speex and libsamplerate.
> To avoid these dependencies we simply disable unittest.
> 
> Fixes
> http://autobuild.buildroot.net/results/da2/da2b6402c8fabd85a9ee728e8dbf7b78c5aa801e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libcodec2/libcodec2.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
