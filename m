From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 Apr 2017 18:34:37 +0200
Subject: [Buildroot] [PATCH] dovecot: bump version to 2.2.29 (security)
References: <20170411100141.1251-1-Vincent.Riera@imgtec.com>
Message-ID: <t5dvrdxkso.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 11 Apr 2017 11:01:41 +0100 schrieb Vicente Olivert Riera:

> Security fix:
> 
>   passdb/userdb dict: Don't double-expand %variables in keys. If dict
>   was used as the authentication passdb, using specially crafted
>   %variables in the username could be used to cause DoS (CVE-2017-2669)
> 
> Full ChangeLog:
> 
>   https://www.dovecot.org/list/dovecot-news/2017-April/000341.html

Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
