From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Jun 2014 22:42:22 +0200
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
Message-ID: <20140605224222.0184a9b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

On Thu, 5 Jun 2014 11:34:41 -0500, Dallas Clement wrote:

> I'm getting killed by autoconf.  My builds take 1.5 hours even with ccache
> turned on.  Most of the cores in my very impressive build machine are

Could you post the build-time.log file of your build, and the .config
file you're using? What are the specifications of your build machine?
Do you build inside a virtual machine ? Do you build over NFS ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
