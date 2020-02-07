From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@essensium.com>
Date: Fri,  7 Feb 2020 12:43:46 +0100
Subject: [Buildroot] [PATCH 0/4] Add python-boto3
Message-ID: <20200207114350.31365-1-raphael.melotte@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rapha?l M?lotte (4):
  package/python-jmespath: new package.
  package/python-botocore: new package.
  package/python-s3transfer: new package.
  package/python-boto3: new package.

 DEVELOPERS                                       |  6 ++++++
 package/Config.in                                |  4 ++++
 package/python-boto3/Config.in                   |  9 +++++++++
 package/python-boto3/python-boto3.hash           |  5 +++++
 package/python-boto3/python-boto3.mk             | 14 ++++++++++++++
 package/python-botocore/Config.in                | 10 ++++++++++
 package/python-botocore/python-botocore.hash     |  5 +++++
 package/python-botocore/python-botocore.mk       | 14 ++++++++++++++
 package/python-jmespath/Config.in                |  6 ++++++
 package/python-jmespath/python-jmespath.hash     |  5 +++++
 package/python-jmespath/python-jmespath.mk       | 14 ++++++++++++++
 package/python-s3transfer/Config.in              |  9 +++++++++
 package/python-s3transfer/python-s3transfer.hash |  5 +++++
 package/python-s3transfer/python-s3transfer.mk   | 14 ++++++++++++++
 14 files changed, 120 insertions(+)
 create mode 100644 package/python-boto3/Config.in
 create mode 100644 package/python-boto3/python-boto3.hash
 create mode 100644 package/python-boto3/python-boto3.mk
 create mode 100644 package/python-botocore/Config.in
 create mode 100644 package/python-botocore/python-botocore.hash
 create mode 100644 package/python-botocore/python-botocore.mk
 create mode 100644 package/python-jmespath/Config.in
 create mode 100644 package/python-jmespath/python-jmespath.hash
 create mode 100644 package/python-jmespath/python-jmespath.mk
 create mode 100644 package/python-s3transfer/Config.in
 create mode 100644 package/python-s3transfer/python-s3transfer.hash
 create mode 100644 package/python-s3transfer/python-s3transfer.mk

-- 
2.23.0
