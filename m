From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 22:44:53 +0100
Subject: [Buildroot] [PATCH 2/7] samba: remove deprecated
In-Reply-To: <1457706744-23401-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 11 Mar 2016 11:32:19 -0300")
References: <1457706744-23401-1-git-send-email-gustavo@zacarias.com.ar>
 <1457706744-23401-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871t7ba016.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It's been deprecated for a year now so remove it.
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  Config.in.legacy                             |   7 +
 >  package/Config.in                            |   1 -
 >  package/samba/0001-fix-smbd-libs-avahi.patch |  17 --
 >  package/samba/0002-getaddrinfo.patch         |  20 --
 >  package/samba/Config.in                      | 292 ---------------------------
 >  package/samba/S91smb                         |  81 --------
 >  package/samba/samba.hash                     |   2 -
 >  package/samba/samba.mk                       | 189 -----------------
 >  package/samba/simple.conf                    |  25 ---

Samba4 was still depending on !BR2_PACKAGE_SAMBA. Committed with that
fixed, thanks.

-- 
Bye, Peter Korsgaard
