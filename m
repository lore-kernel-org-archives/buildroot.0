From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 17 Feb 2016 16:33:00 -0200 (BRST)
Subject: [Buildroot] [PATCH v2 0/1] protobuf: fix detection of
 __atomic_*()	built-ins
In-Reply-To: <1455730981-6316-1-git-send-email-casantos@datacom.ind.br>
References: <1455204185-7124-1-git-send-email-casantos@datacom.ind.br>
 <1455204185-7124-1-git-send-email-casantos@datacom.ind.br>
 <1455730981-6316-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1824328105.3286559.1455733980693.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: buildroot at buildroot.org
> Cc: "thomas petazzoni" <thomas.petazzoni@free-electrons.com>
> Sent: Wednesday, February 17, 2016 3:43:00 PM
> Subject: [Buildroot] [PATCH v2 0/1] protobuf: fix detection of __atomic_*()	built-ins

> - Clarify that we *will* attempt to submit upstream the patch in
>  configure.ac.

In progress:

  - https://goo.gl/Kzju4X
  - https://goo.gl/v6bypJ

> - Small improvements on the wording of the commit message.
> 
> Carlos Santos (1):
>  protobuf: fix detection of __atomic_*() built-ins
> 
> ...GLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch | 61 ++++++++++++++++++++++
> ...configure.ac-check-if-libatomic-is-needed.patch | 34 ++++++++++++
> package/protobuf/Config.in                         | 21 +++++++-
> 3 files changed, 115 insertions(+), 1 deletion(-)
> create mode 100644
> package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
> create mode 100644
> package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch

Carlos Santos (Casantos)
DATACOM, P&D
