From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2014 18:01:26 +0100
Subject: [Buildroot] [PATCH 0/1 v3] FAQ entry about why no binary packages
Message-ID: <cover.1392915370.git.yann.morin.1998@free.fr>
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
    Day we had in Pragues, in 2011;
  - second, a position statement about the issue.


The position statement might be a bit strong in its wordings, so I would
very much appreciate comments about that.

If all agree, I'd suggest this gets in for 2014.02.


Changes v2 -> v3:
  - some grammar and typographical fixes  (Danomi, Arnout, Thomas P)
  - remove conversational tone  (Danomi, Samuel, Thomas P)
  - remove reference to prototype  (Samuel, Thomas P)
  - last item in position statement  (Thomas P)
  - misc typoes  (All)

Changes v1 -> v2:
  - copy the report from the DevDay  (Thomas P)


Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (1):
      manual/faq: add section about why no binary packages

 docs/manual/faq-troubleshooting.txt | 100 ++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
