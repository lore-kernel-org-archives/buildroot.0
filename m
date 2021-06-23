From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jun 2021 09:03:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 3.2.4
In-Reply-To: <20210621192800.254204-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 21 Jun 2021 21:28:00 +0200")
References: <20210621192800.254204-1-fontaine.fabrice@gmail.com>
Message-ID: <87mtrh5ag9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Django 3.2.4 fixes two security issues and several bugs in 3.2.3.
 > - CVE-2021-33203: Potential directory traversal via ``admindocs``
 > - CVE-2021-33571: Possible indeterminate SSRF, RFI, and LFI attacks
 >   since validators accepted leading zeros in IPv4 addresses

 > https://github.com/django/django/blob/3.2.4/docs/releases/3.2.4.txt

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
