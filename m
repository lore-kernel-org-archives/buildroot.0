From: Ben Boeckel <mathstuf@gmail.com>
Date: Sat, 24 Oct 2015 17:39:13 -0400
Subject: [Buildroot] [PATCH 0/1] Build host-libcap with libattr support
Message-ID: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've also sent upstream to always define these symbols, so future versions can
drop the hard-coded host-attr dependency if wanted.

--Ben

Ben Boeckel (1):
  libcap: depend on host-attr for the host

 package/attr/attr.mk     | 1 +
 package/libcap/libcap.mk | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.6.2
