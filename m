From: Hugues Fruchet <hugues.fruchet@st.com>
Date: Wed, 26 Jul 2017 14:11:36 +0200
Subject: [Buildroot] [PATCH v2] package/libv4l: no libv4lconvert helper
	support if no fork()
Message-ID: <1501071097-6301-1-git-send-email-hugues.fruchet@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build libv4lconvert helper support only when fork() is available.
This fix the build issue reported here:
http://autobuild.buildroot.net/results/7e8/7e8fbd99a8c091d7bbeedd16066297682bbe29fe/build-end.log

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>

---
Changes v1 -> v2:
  - point to http://autobuild.buildroot.org build result
  - revisit Author & Signed-off-by

Hugues Fruchet (1):
  package/libv4l: no libv4lconvert helper support if no fork()

 ...lconvert-helper-support-only-when-fork-is.patch | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch

-- 
1.9.1
