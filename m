From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Tue,  1 Sep 2020 16:37:28 +0200
Subject: [Buildroot] [PATCH 0/3] package/python-stegano
Message-ID: <20200901143731.2916-1-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steganography is the art and science of writing
hidden messages in such a way that no one,
apart from the sender and intended recipient,
suspects the existence of the message.
Steganography is often used with cryptography.

Python-stegano allows to apply steganography
easily on images and retrive hidden messages
that were injected.

More about python-stegano is available at :
https://pypi.org/project/stegano/.

Jugurtha BELKALEM (3):
  package/python-crayons : new package
  package/python-piexif : new package
  package/python-stegano : new package

 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  3 +++
 package/python-crayons/Config.in           |  8 ++++++++
 package/python-crayons/python-crayons.hash |  5 +++++
 package/python-crayons/python-crayons.mk   | 14 ++++++++++++++
 package/python-piexif/Config.in            | 10 ++++++++++
 package/python-piexif/python-piexif.hash   |  3 +++
 package/python-piexif/python-piexif.mk     | 13 +++++++++++++
 package/python-stegano/Config.in           | 14 ++++++++++++++
 package/python-stegano/python-stegano.hash |  5 +++++
 package/python-stegano/python-stegano.mk   | 14 ++++++++++++++
 11 files changed, 92 insertions(+)
 create mode 100644 package/python-crayons/Config.in
 create mode 100644 package/python-crayons/python-crayons.hash
 create mode 100644 package/python-crayons/python-crayons.mk
 create mode 100644 package/python-piexif/Config.in
 create mode 100644 package/python-piexif/python-piexif.hash
 create mode 100644 package/python-piexif/python-piexif.mk
 create mode 100644 package/python-stegano/Config.in
 create mode 100644 package/python-stegano/python-stegano.hash
 create mode 100644 package/python-stegano/python-stegano.mk

-- 
2.11.0
