From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Fri, 06 Jun 2014 16:33:24 +0200
Subject: [Buildroot] [PATCH 3/5] gnupg2: new package
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
 <1402062269-57018-4-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <k2096bxgbf.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote in
news:1402062269-57018-4-git-send-email-Vincent.Riera at imgtec.com: 

> +     select BR2_PACKAGE_PTH
> +     depends on !BR2_TOOLCHAIN_USES_UCLIBC # pth

Hi,

afaik gnupg2 is compatible with uclibc if you use the existing libpthsem 
package instead of your new pth package.

Regards, Bernd
