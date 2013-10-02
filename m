From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Oct 2013 22:53:30 +0200
Subject: [Buildroot] [PATCH v3] qt5base: fix build when egl headers need
	a definition
In-Reply-To: <1379574103-9992-1-git-send-email-fatih.asici@gmail.com> ("Fatih
 =?utf-8?B?QcWfxLFjxLEiJ3M=?= message of "Thu, 19 Sep 2013 10:01:43 +0300")
References: <1379574103-9992-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <877gdvpf79.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

 Fatih> The build with gpu-viv-bin-mx6q libraries was broken since it wasn't
 Fatih> using "-DEGL_API_FB=1" flag which is found in egl.pc.

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
