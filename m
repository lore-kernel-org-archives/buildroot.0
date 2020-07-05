From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun,  5 Jul 2020 13:52:40 -0300
Subject: [Buildroot] [PATCH 0/2] package/{snmppp, agentpp}: bump version
Message-ID: <20200705165242.13930-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

New snmppp version breaks compatibility with older versions, so it
should be updated in sync with agentpp.

Sergio Prado

---------------------------------------------------
Sergio Prado (2):
  package/snmppp: bump version to 3.4.1
  package/agentpp: bump version to 4.3.1

 package/agentpp/agentpp.hash | 4 ++--
 package/agentpp/agentpp.mk   | 2 +-
 package/snmppp/snmppp.hash   | 4 ++--
 package/snmppp/snmppp.mk     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.17.1
