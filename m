From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Apr 2012 10:33:51 -0300
Subject: [Buildroot] [PATCHv2 0/3] package/multimedia menu rework
Message-ID: <1335792834-25918-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v2:
* libmpd, libmms & live555 in multimedia section rather than networking
* Also move portaudio to audio libraries section

Gustavo Zacarias (3):
  package/multimedia: move multimedia libraries out
  package/multimedia: move audio libraries out
  package/multimedia: drop libraries, it's just applications now

-- 
1.7.3.4
