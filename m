From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:09:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/libvncserver: fix CVE-2018-20750
In-Reply-To: <20200303190232.226493-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 3 Mar 2020 20:02:31 +0100")
References: <20200303190232.226493-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhcind3d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > LibVNC through 0.9.12 contains a heap out-of-bounds write vulnerability
 > in libvncserver/rfbserver.c. The fix for CVE-2018-15127 was incomplete.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
