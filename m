From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 16:19:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxml2: fix CVE-2020-24977
In-Reply-To: <20200914210644.3473075-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 14 Sep 2020 23:06:44 +0200")
References: <20200914210644.3473075-1-fontaine.fabrice@gmail.com>
Message-ID: <87imbwy8ab.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > GNOME project libxml2 v2.9.10 and earlier have a global Buffer Overflow
 > vulnerability in xmlEncodeEntitiesInternal at libxml2/entities.c.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
