From: Alan Ott <alan@signal11.us>
Date: Sun, 12 Oct 2014 15:56:51 -0400
Subject: [Buildroot] [PATCH 0/2] Updates to Poppler
In-Reply-To: <20140406120221.5a5fd253@skate>
References: <20140406120221.5a5fd253@skate>
Message-ID: <1413143813-26783-1-git-send-email-alan@signal11.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These changes were proposed by Jeremie Scheer <jeremie.scheer@armadeus.com>
earlier this year.

Alan Ott (2):
  poppler: Add option for Qt support
  poppler: Install files into staging

 package/poppler/Config.in  | 9 +++++++++
 package/poppler/poppler.mk | 8 ++++++++
 2 files changed, 17 insertions(+)

-- 
2.1.0
