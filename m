From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 3 Mar 2011 13:47:19 +0100
Subject: [Buildroot] buildroot version from year 2007
In-Reply-To: <20110303115028.117780@gmx.net>
References: <20110303115028.117780@gmx.net>
Message-ID: <201103031347.20015.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zergman, All,

On Thursday 03 March 2011 125028 zergman at gmx.de wrote:
> is there a way to get an old version of the buildroot tool?

---8<---
# git clone git://git.buildroot.net/buildroot.git br-2007
# cd br-2007
# git checkout -b OLD-2007 dc6a57bc6909fbc175c86c044898f1c7694965fd
# git log HEAD^..
commit dc6a57bc6909fbc175c86c044898f1c7694965fd
Author: Thomas Lundquist <lists@zelow.no>
Date:   Thu Dec 27 12:00:12 2007 +0000

    Added BR2_DEBIAN_MIRROR
---8<---

Et voila!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
