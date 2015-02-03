From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Feb 2015 17:27:39 +0100
Subject: [Buildroot] [PATCH v2 2/2] qt5multimedia: enable gstreamer-1.x
 support
In-Reply-To: <1422048008-13659-3-git-send-email-ps.report@gmx.net>
References: <1422048008-13659-1-git-send-email-ps.report@gmx.net>
 <1422048008-13659-3-git-send-email-ps.report@gmx.net>
Message-ID: <54D0F6FB.6030703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/01/15 22:20, Peter Seiderer wrote:
> Add 0002-GStreamer-port-to-1.0.patch [1] from upstream qtmultimedia dev branch
> (will be in qt-5.5) and 0003-Fix-GStreamer-port-to-1.0-compile.patch to fix
> resulting compile failures (private header related).
> 
> Fix qt5multimedia.mk for the gstreamer-1.x case (gst-plugins-base and
> gst1-plugins-base).
> 
> [1] https://qt.gitorious.org/qt/qtmultimedia/commit/108dda7a90bd0f0337358b0db47ae55acd16dea6
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 Hi Peter,

 Since this is a feature patch, and it will be included in an official qt
release a couple of months from now, we're not going to take it.

 It's good that you posted it on the list, however, so other people can use it.
Also, it will be useful for updating the .mk file when qt-5.5 has been released.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
