From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 12 Mar 2013 09:26:51 +0100
Subject: [Buildroot] [PATCH] change default location for local.mk to
	$(CONFIG_DIR)
In-Reply-To: <20130311222630.5a75029d@skate>
References: <1362653363-24915-1-git-send-email-jeremy.rosen@openwide.fr>
 <20130311222630.5a75029d@skate>
Message-ID: <CAAXf6LWABPZcHrftL3LFLVB4ApLdS19-kRME101DG+9rfrfK4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Mar 11, 2013 at 10:26 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear J?r?my Rosen,
>
> On Thu,  7 Mar 2013 11:49:23 +0100, J?r?my Rosen wrote:
>> the previous default of $(TOPDIR) broke the philosophy of builds with O=
>> which try to keep all configuration files within the $(CONFIG_DIR)
>> subtree
>
> Hum, that's an interesting vision of things. I think I would tend to
> agree with this idea.
>
> What do others think?

I can follow the reasoning of J?r?my and have no problems with the
proposed patch.

However, unlike other config files, I still think of local.mk as a
local hack used by an individual developer, and not something you
would put under version control, neither in git nor in
project-specific patches.

Best regards,
Thomas
