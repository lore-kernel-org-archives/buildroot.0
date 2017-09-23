From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 22:24:14 +0200
Subject: [Buildroot] [PATCH v8 0/3] Qt WebEngine support
In-Reply-To: <20170815203854.14456-1-gael.portay@savoirfairelinux.com>
References: <20170815203854.14456-1-gael.portay@savoirfairelinux.com>
Message-ID: <6310d947-979a-2e84-a43f-d45446fe40f5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-08-17 22:38, Ga?l PORTAY wrote:
> Hi all,
> 
> The purpose of this patch series is to continue the integration of Qt5 WebEngine
> in buildroot; started long time ago by Akihiko Odaki [1] and Julien Corjon [2].
> 
> The first patch provides the Qt WebEngine package.
> 
> The second patch is a special defconfig that provides a Qt WebEngine setup on
> raspberrypi3 to provide a demo.
> 
> I have tested it with a rpi 3; and I will be glad if someone else has another
> EGL platform to test it. You will find instructions to try qtwebengine on rpi3
> in the commit message of the first patch.
> 
> Enjoy ;)
> 
> Note: Tested against:
>         - GCC 6.x and binutils 2.27 on rpi 3.
>         - GCC 7.x and binutils 2.28 on rpi 3.
> 
> [1] https://patchwork.ozlabs.org/patch/640633/
> [2] http://lists.busybox.net/pipermail/buildroot/2015-July/132010.html
 I finally applied your patches, with just a few more changes in the structure
of the Config.in dependencies. That was a long time coming, thanks for your
persistence!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
