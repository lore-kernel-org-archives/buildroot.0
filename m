From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2020 17:35:23 +0200
Subject: [Buildroot] [git commit] package/gd: fix CVE-2018-14553 and
 CVE-2019-6977
In-Reply-To: <20200803210521.052B17FA6A@busybox.osuosl.org> (Peter Korsgaard's
 message of "Mon, 3 Aug 2020 23:06:56 +0200")
References: <20200803210521.052B17FA6A@busybox.osuosl.org>
Message-ID: <87sgckynk4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6fa1a32dac3cb4ee03fd11bb965cd4b57d14e86a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > - Fix CVE-2018-14553 : gdImageClone in gd.c in libgd 2.1.0-rc2 through
 >   2.2.5 has a NULL pointer dereference allowing attackers to crash an
 >   application via a specific function call sequence.

 > - Fix CVE-2019-6977: gdImageColorMatch in gd_color_match.c in the GD
 >   Graphics Library (aka LibGD) 2.2.5, as used in the imagecolormatch
 >   function in PHP before 5.6.40, 7.x before 7.1.26, 7.2.x before 7.2.14,
 >   and 7.3.x before 7.3.1, has a heap-based buffer overflow. This can be
 >   exploited by an attacker who is able to trigger imagecolormatch calls
 >   with crafted image data.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
