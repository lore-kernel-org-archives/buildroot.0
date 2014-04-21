From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 14:07:51 +0200
Subject: [Buildroot] [PATCH] system: add ability to pass additional
 users tables.
In-Reply-To: <1398015189-21070-1-git-send-email-yann.morin.1998@free.fr>
References: <1398015189-21070-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140421140751.7c2a8f08@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 20 Apr 2014 19:33:09 +0200, Yann E. MORIN wrote:
> From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> 
> A new entry has been added to the "System Configuration" menu to allow
> the user to set the location of additional user tables (besides the ones
> defined in packages).
> 
> A user table is a text file, formatted using the mkusers syntax, which
> describes the users on the target system, with their UID/GID, home
> directory, password, etc.
> 
> The target root file system will be populated according the content of
> these files.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> [yann.morin.1998 at free.fr: use plural TABLES; we need to remove the
>     intermediate users_table file, as it is no longer generated in
>     one shot, in case a previous run failed and did not remove it]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
