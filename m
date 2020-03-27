From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 27 Mar 2020 22:07:11 +0100
Subject: [Buildroot] friendlyarm neo4
Message-ID: <CAAfyv36FyrVcYtaEwC3J=JuhtnGg2TY0-XYvD7MtecYyL4UnSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I became owner of nanopi neo4 board and was looking around for some
options how to run buildroot on this board. I discovered that BR have
support for this board but was dropped in commit:
8af7b11bd8a95bc41e4de46f727f3b0afde465a4.

Anyway I revert this commit and build an image but when flashed to
SDcard console shows some garbage only and that's it. Anyone have this
board working or am I missing something? Thanks.

BR,

marek
