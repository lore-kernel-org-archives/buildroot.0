From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 13 Apr 2018 13:25:19 -0300
Subject: [Buildroot] [PATCH 0/2] Fix/improve modem-manager init script
Message-ID: <20180413162521.7078-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Initialize the MODEMMANAGER_BIN variable
- Allow a few customizations from a config file

Carlos Santos (2):
  modem-manager: fix test of unset variable in init script
  modem-manager: support a defaults file in the init script

 package/modem-manager/S44modem-manager | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.14.3
