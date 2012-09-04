From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Mon, 3 Sep 2012 23:41:39 -0400
Subject: [Buildroot] Re-submitted patches: Busybox-PAM config and PAM
	default config files
Message-ID: <CADiAo4+F_EGuzCugWNBPhwAjVYccd1Ug4woOwKc4gBOdi9PG9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have just re-submitted the two recent patches to add a Busybox
configuration option to enable PAM support in the Buildroot
configurator, and to provide the default PAM config files so
password-less login still is possible for local "default" and "root"
accounts when PAM is enabled. The patches were initially submitted
mid-August [1].

Now that the August release has been completed, I have rebased my
patches against the current master. I have also implemented Arnout's
suggestions [2]

Hopefully everything is OK in these patches, and they can be committed
to master. This will complete the linux-pam integration, and I'll
begin preparing systemd patches shortly after.

Thanks.

[1] http://lists.busybox.net/pipermail/buildroot/2012-August/057491.html
     http://lists.busybox.net/pipermail/buildroot/2012-August/057490.html

[2] http://lists.busybox.net/pipermail/buildroot/2012-August/057822.html

-- 
Dmitry Golubovsky

Anywhere on the Web
