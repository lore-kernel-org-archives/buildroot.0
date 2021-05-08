From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 16:36:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/cifs-utils: security bump to
 version 6.13
In-Reply-To: <20210507193929.2591251-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 7 May 2021 21:39:29 +0200")
References: <20210507193929.2591251-1-fontaine.fabrice@gmail.com>
Message-ID: <87v97twaux.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-20208: A flaw was found in cifs-utils in versions before
 > 6.13. A user when mounting a krb5 CIFS file system from within a
 > container can use Kerberos credentials of the host. The highest threat
 > from this vulnerability is to data confidentiality and integrity.

 > https://lists.samba.org/archive/samba-technical/2021-April/136467.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
