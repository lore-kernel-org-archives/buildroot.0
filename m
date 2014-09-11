From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Sep 2014 23:43:33 +0200
Subject: [Buildroot] Problem with building Divine; wrong Path
In-Reply-To: <5B70540BA10E7D49BEC1ACD5D4148853540BB0C644@FS-SBS2008.fs-net.local>
References: <5B70540BA10E7D49BEC1ACD5D4148853540BB0C644@FS-SBS2008.fs-net.local>
Message-ID: <20140911234333.19976c3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Zeiler,

Please don't top post, thanks!

On Wed, 10 Sep 2014 14:26:06 +0200, Andreas Zeiler wrote:

> thanks for reply. I cannot try this with 2014.08. I know that there
> are many fixes but first I need to merge to 2013.05 because another
> platform has this version and we want to merge these platforms to one.

I understand, but you also need to understand that as volunteers
working in an open-source community, we can hardly spend time
supporting old versions of Buildroot. We very much prefer to focus our
efforts on recent versions, where fixes are benefiting everybody, not
just one person.

> Also I tried with removing toolchain from PATH. This had no effect. I
> also removed the toolchainpath from the menuconfig but then the
> toolchain couldn't been found at all.

Since you're using an external toolchain, I would need the tarball of
this toolchain (upload it somewhere), and then your Buildroot .config
(or a simpler Buildroot .config, as long as it exhibits the problem).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
