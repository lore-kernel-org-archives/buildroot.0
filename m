From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 22:16:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: needs host-python3
In-Reply-To: <CAPi7W81je75sj_ZHsW2W-3jivgL3Q6q7ZACefoHHY_UW762NQQ@mail.gmail.com>
References: <20200308111812.3065154-1-fontaine.fabrice@gmail.com>
 <20200308150547.21a882d7@windsurf.home>
 <CAPi7W81je75sj_ZHsW2W-3jivgL3Q6q7ZACefoHHY_UW762NQQ@mail.gmail.com>
Message-ID: <20200309221649.3dc8752c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 8 Mar 2020 15:56:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> I'm not an expert in waf but we were already setting
> PYTHON="$(HOST_DIR)/bin/python2" in SAMBA4_PYTHON.
> SAMBA4_PYTHON is then passed to configure in SAMBA4_CONFIGURE_CMDS and
> to make in SAMBA4_BUILD_CMDS.
> This indeed allow the user to use python2 in configure and make but
> the waf script will still mandate than python3 is installed on the
> host.
> It should be noted that this dependency is clearly stated in the
> following commit log:
> https://gitlab.com/samba-team/devel/samba/-/commit/05791f40a6e78e628ec4ab2fb0e13b2c7fbb1b78.

Thanks for the additional explanation, I've applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
