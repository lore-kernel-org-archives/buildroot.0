From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Feb 2014 18:52:08 +0100
Subject: [Buildroot] [PATCH 0/1 v2] FAQ entry about why no binary packages
Message-ID: <cover.1392659250.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Every now and then, someone will ask why Buildroot has no support for
generating binary packages.

Rather than re-hash the same answer every time, the following patch
adds a section in the FAQ in the manual, that we can point users to.

The patch is two-fold:
  - first, a (slightly tweaked) copy-paste of the report of a Developpers
    Day we had in Pragues, in 2011,
  - second, a position statement about the issue.


The position statement might be a bit strong in its wordings, so I would
very much appreciate comments about that.


Changes v1 -> v2:
  - copy the report from the DevDay  (Thomas P)


Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (1):
      manual/faq: add section about why no binary packages

 docs/manual/faq-troubleshooting.txt | 91 +++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
