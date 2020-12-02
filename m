From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Dec 2020 08:17:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: security bump to
 version 5.4.1
In-Reply-To: <20201202063243.1103254-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 2 Dec 2020 07:32:43 +0100")
References: <20201202063243.1103254-1-fontaine.fabrice@gmail.com>
Message-ID: <87a6uwy8we.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-25412: com_line() in command.c in gnuplot 5.4 leads to an
 >   out-of-bounds-write from strncpy() that may lead to arbitrary code
 >   execution.
 > - Drop second patch (already in version)
 > - Update indentation in hash file (two spaces)

 > http://gnuplot.info/ReleaseNotes_5_4_1.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
