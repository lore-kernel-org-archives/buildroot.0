From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 00:29:14 +0200
Subject: [Buildroot] [PATCH v3 2/2] fcgiwrap: new package
In-Reply-To: <1432916111-1122-2-git-send-email-thomas.claveirole@green-communications.fr>
References: <1432916111-1122-1-git-send-email-thomas.claveirole@green-communications.fr>
 <1432916111-1122-2-git-send-email-thomas.claveirole@green-communications.fr>
Message-ID: <20150711002914.2dd1fc0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Claveirole,

On Fri, 29 May 2015 18:15:11 +0200, Thomas Claveirole wrote:
> Add package fcgiwrap from https://nginx.localdomain.pl/wiki/FcgiWrap
> 
> fcgiwrap is a simple server for running CGI applications over
> FastCGI. It hopes to provide clean CGI support to Nginx (and other web
> servers that may need it).
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/Config.in                                  |  1 +
>  .../fcgiwrap/0001-use-LIBS-from-configure.patch    | 22 +++++++++++++++
>  package/fcgiwrap/Config.in                         | 10 +++++++
>  package/fcgiwrap/fcgiwrap.mk                       | 32 ++++++++++++++++++++++
>  4 files changed, 65 insertions(+)
>  create mode 100644 package/fcgiwrap/0001-use-LIBS-from-configure.patch
>  create mode 100644 package/fcgiwrap/Config.in
>  create mode 100644 package/fcgiwrap/fcgiwrap.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
