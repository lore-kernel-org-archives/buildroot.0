From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 01 May 2015 09:32:36 -0300
Subject: [Buildroot] [PATCH v2 1/1] package/boost: bump to version 1.58.0
In-Reply-To: <1430482091-8140-1-git-send-email-joerg.krause@embedded.rocks>
References: <1430482091-8140-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <55437264.90900@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/2015 09:08 AM, J?rg Krause wrote:

> Add upstream patch from [1] to fix autobuild error [2] for mips:
> 	mipsel-linux-g++: error: unrecognized command line option '-m32'
> 
> [1] https://github.com/boostorg/build/commit/c0634341d9ee2c02d3a55c91dafb988afc066c49
> [2] http://autobuild.buildroot.org/results/66c/66c3a868816dfe4bd4d0ffafec6988fd87a2c058/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Hi.
It will need some extra tweaking since it failed in a similar way for sh4:
http://autobuild.buildroot.net/results/ccd/ccd5c83963032ba49b1627b1dff39e34a9486943/build-end.log

Regards.
