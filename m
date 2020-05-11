From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2020 21:23:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: fix CVE-2019-20788
In-Reply-To: <87k11jorvr.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 11 May 2020 09:25:12 +0200")
References: <20200502200747.3438774-1-fontaine.fabrice@gmail.com>
 <87k11jorvr.fsf@dell.be.48ers.dk>
Message-ID: <87tv0mnumw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> libvncclient/cursor.c in LibVNCServer through 0.9.12 has a
 >> HandleCursorShape integer overflow and heap-based buffer overflow via a
 >> large height or width value. NOTE: this may overlap CVE-2019-15690.

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
