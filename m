From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 21:34:02 +0200
Subject: [Buildroot] [PATCH 3/3] support/script/scancpan: add option test
In-Reply-To: <1412188619-3981-3-git-send-email-francois.perrad@gadz.org>
References: <1412188619-3981-1-git-send-email-francois.perrad@gadz.org>
 <1412188619-3981-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20141001213402.553f2999@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed,  1 Oct 2014 20:36:59 +0200, Francois Perrad wrote:
> test modules are usually useless on BR
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Sorry for asking only now, but can we have a real commit message that
explains what's going on?

Something like:

"""
This commit adds a new -test option to the scancpan script, which
allows to ...
"""

With your current message "test modules are usually useless on BR", I
don't understand what this option does: does it disables test modules?
does it enables it? what does it change compared to the previous
situation?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
