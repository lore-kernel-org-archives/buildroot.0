From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Apr 2017 11:08:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-04-27
In-Reply-To: <20170428084433.7pb5lamlgxy2hzau@tarshish>
References: <20170428062842.1E44E20E06@mail.free-electrons.com>
 <20170428084433.7pb5lamlgxy2hzau@tarshish>
Message-ID: <20170428110851.03eff198@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Apr 2017 11:44:33 +0300, Baruch Siach wrote:

> Incompatibility of ola with protobuf 3.2.0. An upstream issue[1] is open since 
> January.
> 
> Should we revert the protobuf bump? Remove ola?

Remove ola is I believe the right approach. According to the Github
issue, Fedora has done the same thing.

I believe it's more important to stay up-to-date with protobuf than it
is to keep ola as a package, especially since ola is not used as a
dependency for any other package.

Maybe just mark it BROKEN for now?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
