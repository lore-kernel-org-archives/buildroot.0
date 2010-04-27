From: Rob Alley <Rob.Alley@navmanwireless.com>
Date: Wed, 28 Apr 2010 10:39:37 +1200
Subject: [Buildroot] ARM default configuration
In-Reply-To: <t2n478c82f01004270125q2970af56odc45550d676618d8@mail.gmail.com>
References: <t2n478c82f01004270125q2970af56odc45550d676618d8@mail.gmail.com>
Message-ID: <6053D9B413B89B4B8F9BE37E4B6F594702FB5473@nwap-auck-ex2.NW.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> What ARM default configurations are supposed to work ? I tried a few,
including  integrator926_defconfig, but none of them compiled. 
> Or maybe I do not understand the idea of default configuration. Isn't
it supposed to compile without errors and without asking the user for
input ?

I believe they are all **supposed** to work.  The at91sam9260 and
at91sam9g20 defconfigs work for me.  You may still be prompted for user
inputs the first time - buildroot is constantly being updated but the
default configs get left behind, this results in prompting for new
packages etc.
 
Rob.
