From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 20 Mar 2008 11:47:21 +0100
Subject: [Buildroot] ncurse address error
References: <823018ed0803180357s43bf8890s37521d7606aca432@mail.gmail.com>
Message-ID: <00be01c88a77$c9601e00$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's an extra 'gnu' being appended in the path:

wget --passive-ftp  -P /home/guinevere/buildroot/dl 
"http://ftp.gnu.org/pub/gnu"/gnu/ncurses/ncurses-5.6.tar.gz
--11:44:49--  http://ftp.gnu.org/pub/gnu/gnu/ncurses/ncurses-5.6.tar.gz
           => `/home/guinevere/buildroot/dl/ncurses-5.6.tar.gz'
Resolving ftp.gnu.org... 140.186.70.20
Connecting to ftp.gnu.org|140.186.70.20|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
11:44:49 ERROR 404: Not Found.

-- 
Guillaume Dargaud
http://www.gdargaud.net/
