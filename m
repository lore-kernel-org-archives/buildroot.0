From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Sep 2013 21:15:11 +0200
Subject: [Buildroot] [PATCH 2/6] libcdaudio: disable autoreconf
In-Reply-To: <1379350375-18843-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 16 Sep 2013 13:52:51 -0300")
References: <1379350375-18843-1-git-send-email-gustavo@zacarias.com.ar>
 <1379350375-18843-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k3icfwsg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> There's no stated purpose and it breaks with automake 1.12+
 Gustavo> If it breaks in some scenario ping me, i've got a patch to fix the
 Gustavo> autoreconf issue and re-enable it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
