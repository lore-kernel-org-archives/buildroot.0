From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:51:30 +0200
Subject: [Buildroot] [PATCH] package/qt5tools: enable build of host qdoc
In-Reply-To: <28738_1565076937_5D492DC9_28738_415_6_1c814794-eadf-4330-8cba-ab0686d724e0@OPEXCNORMAE.corporate.adroot.infra.ftgroup>
References: <28738_1565076937_5D492DC9_28738_415_6_1c814794-eadf-4330-8cba-ab0686d724e0@OPEXCNORMAE.corporate.adroot.infra.ftgroup>
Message-ID: <0fa67365-b8e3-8a2d-f877-7ee0ecdf1853@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/08/2019 09:35, yann.morin at orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> qdoc was previously built as part of qtbase (in the pre-5.6 era), but
> with qt-5.6 it is now part of qttools.
> 
> With qt-5.12, it needs libclang to build, so be it...
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Julien Corjon <corjon.j@ecagroup.com>

 Applied to master, thanks.

 Regards,
 Arnout
