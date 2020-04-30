From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:42:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/ogre: fix build with RELRO
In-Reply-To: <20200412224911.65d47f8b@windsurf.home> (Thomas Petazzoni's
 message of "Sun, 12 Apr 2020 22:49:11 +0200")
References: <20200210174511.719351-1-fontaine.fabrice@gmail.com>
 <20200412224911.65d47f8b@windsurf.home>
Message-ID: <87d07p5emt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 10 Feb 2020 18:45:11 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/b64dfcd8e576666e8a4a52da81a2f5a92b779dc7
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> ...ompiledHeader.cmake-Add-c-argument-t.patch | 57 +++++++++++++++++++
 >> 1 file changed, 57 insertions(+)
 >> create mode 100644 package/ogre/0001-CMake-Utils-PrecompiledHeader.cmake-Add-c-argument-t.patch

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
