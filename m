From: Hugues Fruchet <hugues.fruchet@st.com>
Date: Wed, 26 Jul 2017 12:19:50 +0200
Subject: [Buildroot] [PATCH v1] package/libv4l: no libv4lconvert helper
	support if no fork()
Message-ID: <1501064391-32685-1-git-send-email-hugues.fruchet@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build libv4lconvert helper support only when fork() is available.
This fix the build issue reported here:
http://lists.buildroot.org/pipermail/buildroot/2017-July/197571.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>

Hugues Fruchet (1):
  package/libv4l: no libv4lconvert helper support if no fork()

 ...lconvert-helper-support-only-when-fork-is.patch | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch

-- 
1.9.1
