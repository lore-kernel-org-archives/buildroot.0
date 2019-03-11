From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Mar 2019 09:01:09 +0100
Subject: [Buildroot] [PATCH v3 0/2] Add gettext-tiny package
In-Reply-To: <20190310101852.GB25009@scaer>
References: <20190212215520.7422-1-vadim4j@gmail.com>
 <20190309233742.3095c546@windsurf>
 <20190310002005.jglt6ptlgctyz6eb@vkochan-ThinkPad-T470p>
 <20190310101126.3d738624@windsurf> <20190310101852.GB25009@scaer>
Message-ID: <20190311090109.1c2392be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Mar 2019 11:18:52 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Alternatively, I believe it would be relatively trivial to provide a
> fake gettext rwapper:

Well, that was the whole point of the discussion in my initial reply to
Vadim's v3. Do we want to create a gettext-tiny target variant, which
would install a fake gettext wrapper, or do we say "if NLS is disabled,
there is no gettext support on the target". See my reply to Vadim v3
cover letter.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
