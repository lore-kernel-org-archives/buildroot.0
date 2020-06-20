From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 08:34:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/circus: bump to version 0.16.1
In-Reply-To: <20200619215542.257729-1-fontaine.fabrice@gmail.com>
References: <20200619215542.257729-1-fontaine.fabrice@gmail.com>
Message-ID: <20200620083454.30ee9e78@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Jun 2020 23:55:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ame-async-argument-of-_create_circus.patch | 97 -------------------
>  package/circus/circus.hash                    |  4 +-
>  package/circus/circus.mk                      |  4 +-
>  3 files changed, 4 insertions(+), 101 deletions(-)
>  delete mode 100644 package/circus/0001-circus-tests-rename-async-argument-of-_create_circus.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
