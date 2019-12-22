From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 20:35:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/libv4l: fix musl build
In-Reply-To: <20191208143509.05d71702@windsurf.home> (Thomas Petazzoni's
 message of "Sun, 8 Dec 2019 14:35:09 +0100")
References: <20191030065303.22948-1-bernd.kuhls@t-online.de>
 <20191208143509.05d71702@windsurf.home>
Message-ID: <877e2o17cv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 30 Oct 2019 07:53:02 +0100
 > Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

 >> Fixes:
 >> http://autobuild.buildroot.net/results/bf8/bf88f89bdb966ef54938e4274114d4afe5668b1f/
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> ...d-missing-includes-to-fix-musl-build.patch | 68 +++++++++++++++++++
 >> 1 file changed, 68 insertions(+)
 >> create mode 100644 package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
