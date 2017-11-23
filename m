From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 23:16:58 +0100
Subject: [Buildroot] [PATCH v5] qt5: remove Qt Quick dependency on opengl
In-Reply-To: <1509667284-13771-1-git-send-email-joshua.henderson@microchip.com>
References: <1509667284-13771-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20171123231658.0c461b68@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter (Seiderer),

Could you review/ack/test this Qt 5 related patch? Your
opinion/feedback on Qt5 patches is always very valuable. Thanks!

On Thu, 2 Nov 2017 17:01:24 -0700, Joshua Henderson wrote:
> Qt Quick should no longer depend on opengl, and instead fallback to the limited
> functionality software renderer as a replacement [1] when not available. This
> also pulls in an upstream qt5declarative 5.10 patch [2], replacing an existing
> one, to qt5 5.9.2 to fix no-opengl builds.
> 
> [1] http://blog.qt.io/blog/2016/08/15/the-qt-quick-graphics-stack-in-qt-5-8/
> [2] http://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=fa52bb665d6b
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
