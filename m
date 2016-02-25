From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:04:17 +0100
Subject: [Buildroot] [PATCH 1/1] Added OK/FAIL output to SNMP init
 script.
In-Reply-To: <56CF6784.5030403@gmx.de>
References: <1456335081-4834-1-git-send-email-universeII@gmx.de>
 <20160225104643.0921463c@free-electrons.com>
 <56CF5DBF.2060109@gmx.de>
 <20160225212541.6e6e5356@free-electrons.com>
 <56CF6784.5030403@gmx.de>
Message-ID: <20160225220417.7df2cbca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Feb 2016 21:43:48 +0100, Andreas Ehmanns wrote:

> one "stupid" questions. Shall the patches be incremental or relative to 
> the original file?
> Example: Change some lines and create the first patch. Then change the 
> next things based on the original file or based on the already patched file?

Based on the already patched file of course, otherwise you won't go
very far. You need to create a patch series. To do this, create a Git
branch, make a set of commits that stack on top of each other, and then
use git format-patch to create one patch file for each commit in your
branch, and send them with git send-mail.

You can look in the Buildroot manual, there are some explanations about
this:

   http://nightly.buildroot.org/#submitting-patches

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
