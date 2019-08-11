From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:55:22 +0200
Subject: [Buildroot] [PATCH v2] package/restclient-cpp: new package
In-Reply-To: <1565414633-17846-1-git-send-email-gilles.talis@gmail.com>
References: <1565414633-17846-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20190811145522.263be5c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 10 Aug 2019 07:23:53 +0200
Gilles Talis <gilles.talis@gmail.com> wrote:

> restclient-cpp is a simple REST client library for C++
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
> Changes v1 -> v2:
> - Added a description of package in commit message
> - Switched to github helper macro to download package
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/restclient-cpp/Config.in           | 13 +++++++++++++
>  package/restclient-cpp/restclient-cpp.hash |  3 +++
>  package/restclient-cpp/restclient-cpp.mk   | 18 ++++++++++++++++++
>  5 files changed, 36 insertions(+)
>  create mode 100644 package/restclient-cpp/Config.in
>  create mode 100644 package/restclient-cpp/restclient-cpp.hash
>  create mode 100644 package/restclient-cpp/restclient-cpp.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
