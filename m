From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 5 Aug 2010 15:35:06 +0200
Subject: [Buildroot]  [PATCH]: Added splashy package.
Message-ID: <AANLkTikCiu-MEJcq7O-4zCY6ADvPuAaX3AuhBuE-6ucA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Splashy is a next generation boot splashing system for Unix-like systems.
It's only compile tested (don't have a board with display).

Splashy is located at server which need certificate. To avoid that
configure wget option with
--no-check-certificate to properly package download.
