From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:47:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-xlrd: bump to version
 1.2.0
In-Reply-To: <20190827172812.10594-9-asafka7@gmail.com>
References: <20190827172812.10594-1-asafka7@gmail.com>
 <20190827172812.10594-9-asafka7@gmail.com>
Message-ID: <20190829224744.779410dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Tue, 27 Aug 2019 20:28:10 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-xlrd/python-xlrd.hash | 7 +++----
>  package/python-xlrd/python-xlrd.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 6 deletions(-)

You forgot to test "legal-info" after this change: the xlrd/licences.py
file no longer exists, it has been replaced by a file called LICENSE.

I fixed this, and took this opportunity to add a hash for the license
file. Make sure to test "legal-info" when bumping packages.

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
