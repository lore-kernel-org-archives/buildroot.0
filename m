From: gomsis <tuzaklirefik@gmail.com>
Date: Thu, 29 Jun 2017 23:12:50 -0700 (PDT)
Subject: [Buildroot] the problem with Xorg, QT5 and imx vivant dirver
In-Reply-To: <CAAMH-ysPacctbWpfsCLBbNm4EsJ4zOd2swtRmRbLRa-o4Hkg2Q@mail.gmail.com>
References: <CAMWiJUu_C8sJ+gaQdxQjAUS5wk_HEwzOdtEp4komzqOeB5XCBA@mail.gmail.com>
 <20160802213044.264e63f8@free-electrons.com>
 <CAMWiJUs2371W5JZGnDuAozTCKUHKQtoU+V1hrb1rHKsh=nG6DA@mail.gmail.com>
 <20160803115341.21a3018b@free-electrons.com>
 <CAAMH-yvnsS7vq=XS_E0iLaRV-XZi2aQkHSKujn5FuZ5kK5=dug@mail.gmail.com>
 <CAMWiJUtJa4ppP3gdneeCYwtuxx4ba2w02MTjjWC7cmiUZgdGMw@mail.gmail.com>
 <CAAMH-ysPacctbWpfsCLBbNm4EsJ4zOd2swtRmRbLRa-o4Hkg2Q@mail.gmail.com>
Message-ID: <1498803170303-168690.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have applied configuration below in buildroot 2017.08

I applied patch  https://patchwork.ozlabs.org/patch/742261/ to enable
webengine

Target packages->Hardware handling->Freescale imx libraries->imx-gpu-vi
Target packages->Graphic libraries-> QT5->opengl support and eglfs support

I disable x11 and mesa3d.
there is problem while compiling with this configuration

 when I run demobrowser from qt with eglfs it crash and says "Could not open
egl display"
 when I run it with directfb, it accupies half of the CPU so GPU does not
start.




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/the-problem-with-Xorg-QT5-and-imx-vivant-dirver-tp142006p168690.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
