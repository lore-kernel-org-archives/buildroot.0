From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 14 Dec 2018 19:00:24 -0800
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-13
In-Reply-To: <20181214070027.BE571207D4@mail.bootlin.com>
References: <20181214070027.BE571207D4@mail.bootlin.com>
Message-ID: <CAMo8BfK4ViC7TJtBoiuuvYKo+WX1fq+C=T5EFxrKqBWOfFu9hQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 13, 2018 at 11:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>       xtensa |    libtorrent-rasterbar-1.1.11 | http://autobuild.buildroot.net/results/15b2708aaad9bb63cf645b4f5b10e9e2cc4bf1f4

In file included from peer_connection.cpp:56:0:
../include/libtorrent/peer_connection.hpp:550:8: error: generic thunk
code fails for method 'virtual void
libtorrent::peer_connection::_ZThn96_NK10libtorrent15peer_connection8peer_logENS_14peer_log_alert11direction_tEPKcS4_z(libtorrent::peer_log_alert::direction_t,
const char*, const char*, ...) const' which uses '...'
   void peer_log(peer_log_alert::direction_t direction
        ^~~~~~~~

>       xtensa |                      pcre-8.42 | http://autobuild.buildroot.net/results/386ab0a7418cae13d52d451966a9fb0293219c39

/tmp/ccjRg877.s: Assembler messages:
/tmp/ccjRg877.s:1719: Error: loop too long for LOOP instruction
/tmp/ccjRg877.s:1719: Error: operand 3 of 'addmi' has invalid value '55552'
make[2]: *** [libpcre_la-pcre_exec.lo] Error 1

These two appear to be the compiler issues. I'll take a look.

-- 
Thanks.
-- Max
