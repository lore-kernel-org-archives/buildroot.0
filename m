From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 14 Jan 2020 21:17:06 -0500
Subject: [Buildroot] [PATCH v2 0/3] Version bumps for PRU packages
In-Reply-To: <20200114005842.45810-2-ashcharles@gmail.com>
References: <20200114005842.45810-2-ashcharles@gmail.com>
Message-ID: <20200115021709.64647-1-ashcharles@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump versions for TI's PRU co-processor toolcahin and support libraries.

Note, I don't have hardware so I'm unable to confirm that these versions
do more than build correctly.

v2: Add signed-off-by, correct license files and update/add hashes for
licenses per [1,2]. Underlying licenses are the same.
[1] https://patchwork.ozlabs.org/patch/1222414/#2341881
[2] https://patchwork.ozlabs.org/patch/1222415/#2341882

Ash Charles (3):
  ti-cgt-pru: bump to latest version 2.3.3
  pru-software-support: bump to latest version 5.6.0
  pru_software_support: add license file to hash

 package/pru-software-support/pru-software-support.hash | 3 ++-
 package/pru-software-support/pru-software-support.mk   | 9 +++++----
 package/ti-cgt-pru/ti-cgt-pru.hash                     | 6 +++---
 package/ti-cgt-pru/ti-cgt-pru.mk                       | 6 +++---
 4 files changed, 13 insertions(+), 11 deletions(-)

-- 
2.24.1
