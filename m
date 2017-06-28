From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 28 Jun 2017 10:15:11 +0200
Subject: [Buildroot] [PATCH 0/3] package/python-web2py: clean package
Message-ID: <1498637714-18933-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series cleans the web2py package.

Angelo Compagnucci (3):
  package/python-web2py: cleaning installation
  package/python-web2py: move password generation
  package/python-web2py: remove admin panel

 package/python-web2py/Config.in        | 11 +++++++++++
 package/python-web2py/python-web2py.mk | 33 +++++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.7.4
