From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 4 Sep 2017 17:12:38 -0300 (BRT)
Subject: [Buildroot] Use of $(BR2_PATH) in recipes
Message-ID: <1038181832.8086036.1504555958424.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Is it safe to use $(BR2_PATH) in my private recipes? I noticed that it
is used in 10 packages (alljoyn-base, alljoyn, autofs, faifa, freetype,
gpm, libhid, nodejs, runc, sdl) even though it is not documented in the
Buildroot manual.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
Rua Am?rica, 1000 - Eldorado do Sul, RS, Brasil - 92990-000
casantos at datacom.ind.br          +55 51 3933.3000 ext. 3627
http://www.datacom.ind.br
