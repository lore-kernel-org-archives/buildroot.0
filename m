From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 22:36:17 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/python-markdown2: bump to
 version 2.3.9
In-Reply-To: <20200512165436.4104-1-fontaine.fabrice@gmail.com>
References: <20200512165436.4104-1-fontaine.fabrice@gmail.com>
Message-ID: <20200515223617.1ae06ef9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 May 2020 18:54:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...gs-with-punctuation-after-as-part-of.patch | 53 -------------------
>  .../0002-Better-fix-for-issue-348.patch       | 32 -----------
>  .../python-markdown2/python-markdown2.hash    |  6 +--
>  package/python-markdown2/python-markdown2.mk  |  8 +--
>  4 files changed, 5 insertions(+), 94 deletions(-)
>  delete mode 100644 package/python-markdown2/0001-Fix-for-issue-348-incomplete-tags-with-punctuation-after-as-part-of.patch
>  delete mode 100644 package/python-markdown2/0002-Better-fix-for-issue-348.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
