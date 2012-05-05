From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 May 2012 23:41:51 +0200
Subject: [Buildroot] [PATCHv3 0/3] package/multimedia menu rework
In-Reply-To: <1335793697-27149-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 30 Apr 2012 10:48:14 -0300")
References: <1335793697-27149-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y5p6b90g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> v3:
 Gustavo> * Remove audiofile from package/multimedia/Config.in

 Gustavo> v2:
 Gustavo> * libmpd, libmms & live555 in multimedia section rather than networking
 Gustavo> * Also move portaudio to audio libraries section

 Gustavo> Gustavo Zacarias (3):
 Gustavo>   package/multimedia: move multimedia libraries out
 Gustavo>   package/multimedia: move audio libraries out
 Gustavo>   package/multimedia: drop libraries, it's just applications now

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
