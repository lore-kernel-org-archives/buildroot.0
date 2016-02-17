From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 17 Feb 2016 15:43:00 -0200
Subject: [Buildroot] [PATCH v2 0/1] protobuf: fix detection of __atomic_*()
	built-ins
In-Reply-To: <1455204185-7124-1-git-send-email-casantos@datacom.ind.br>
References: <1455204185-7124-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1455730981-6316-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Clarify that we *will* attempt to submit upstream the patch in
  configure.ac.

- Small improvements on the wording of the commit message.

Carlos Santos (1):
  protobuf: fix detection of __atomic_*() built-ins

 ...GLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch | 61 ++++++++++++++++++++++
 ...configure.ac-check-if-libatomic-is-needed.patch | 34 ++++++++++++
 package/protobuf/Config.in                         | 21 +++++++-
 3 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
 create mode 100644 package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch

-- 
2.5.0
