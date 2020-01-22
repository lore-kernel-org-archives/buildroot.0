From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2020 20:51:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/libjpeg: security bump to
 version 9d
In-Reply-To: <20200122191130.55384-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 22 Jan 2020 20:11:30 +0100")
References: <20200122191130.55384-1-fontaine.fabrice@gmail.com>
Message-ID: <87d0bbxob2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2018-11813: libjpeg 9c has a large loop because read_pixel in
 >   rdtarga.c mishandles EOF.
 > - Update hash of README (small updates such as authors, year ...)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
