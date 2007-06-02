From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 2 Jun 2007 12:26:14 +0200
Subject: [Buildroot] ALSA tools for build-root
In-Reply-To: <46613FBE.7080709@teamboyce.co.uk>
References: <46613FBE.7080709@teamboyce.co.uk>
Message-ID: <20070602102614.GK12010@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 02, 2007 at 11:00:30AM +0100, Rod Boyce wrote:
>All,

>+$(foreach var,$(ALSA-TOOLS_TGTS),$(eval $(call alsa-mk_target,$(var))))

I think that creating rules with a define was horribly broken with
anything older than make-3.81

Did you test these changes against make-3.80, which is the oldest
version that is currently needed to use buildroot?
