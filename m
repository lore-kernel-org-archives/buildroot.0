From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Jul 2014 22:58:02 +0200
Subject: [Buildroot] [PATCH 0/2] flickcurl: new package (branch yem/misc)
Message-ID: <cover.1406581025.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Update to the flickcurl package from Peter, with the kconfig recursive
dependency issue fixed byt tweaking the "offender": lftp.

Regards,
Yann E. MORIN.


The following changes since commit abded6bfead49d61c24a45d811a83ca082adf677:

  icu: add an option to add a custom data library file (2014-07-28 22:43:04 +0200)

are available in the git repository at:

  git://ymorin.is-a-geek.org/buildroot yem/misc

for you to fetch changes up to c00ebca71aec2bc2434dc90f3b249c2519158323:

  flickcurl: new package (2014-07-28 22:55:23 +0200)

----------------------------------------------------------------
Peter Korsgaard (1):
      flickcurl: new package

Yann E. MORIN (1):
      package/lftp: inverse the openssl/gnutls selection

 package/Config.in                                  |  1 +
 package/flickcurl/Config.in                        | 19 ++++++++++
 ...ttps-for-all-service-endpoints.-HTTP-EOL-.patch | 40 ++++++++++++++++++++++
 ...auth-services-are-on-https-www.flickr.com.patch | 30 ++++++++++++++++
 package/flickcurl/flickcurl.mk                     | 23 +++++++++++++
 package/lftp/Config.in                             |  2 +-
 6 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 package/flickcurl/Config.in
 create mode 100644 package/flickcurl/flickcurl-0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch
 create mode 100644 package/flickcurl/flickcurl-0002-Oauth-services-are-on-https-www.flickr.com.patch
 create mode 100644 package/flickcurl/flickcurl.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
