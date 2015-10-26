From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 14:16:45 +0100
Subject: [Buildroot] [git commit] x265: new package
In-Reply-To: <CAHCOiUR7k3dquucMLQb+HiLuYmpCnyeTSygv+xV2VS0PHp=sdA@mail.gmail.com>
 (Thijs Vermeir's message of "Mon, 26 Oct 2015 13:49:30 +0100")
References: <20151025213049.17FF27FACD@busybox.osuosl.org>
 <CAHCOiUR7k3dquucMLQb+HiLuYmpCnyeTSygv+xV2VS0PHp=sdA@mail.gmail.com>
Message-ID: <87y4epdb2a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thijs" == Thijs Vermeir <thijsvermeir@gmail.com> writes:

Hi,

 >> +ifeq ($(BR2_PACKAGE_X265_CLI),y)
 >> +X265_CONF_OPTS += -DENABLE_CLI=true
 >> +else
 >> +X265_CONF_OPTS += -DENABLE_CLI=else
 >> +endif

 > This might be a bit too positive :-) (always resolves to true)

Gaah, I wonder what happened to that s/fa/e/ - I'll fix.

-- 
Venlig hilsen,
Peter Korsgaard 
